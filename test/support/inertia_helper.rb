# frozen_string_literal: true

require "minitest/mock"

module InertiaHelper
  module TestWrapper
    include InertiaHelper

    def run(...)
      install_inertia_test_renderer do
        super
      end
    end
  end

  class InertiaRenderWrapper
    attr_reader :view_data, :props, :component

    def initialize
      @view_data = nil
      @props = nil
      @component = nil
    end

    def call(params)
      assign_values_from_params(params)
      @render_method&.(params)
    end

    def wrap_render(render_method)
      @render_method = render_method
      self
    end

    protected

    def assign_values_from_params(params)
      if params[:locals].present?
        @view_data = params[:locals].except(:page)
        @props = params[:locals][:page][:props]
        @component = params[:locals][:page][:component]
      else
        # Sequential Inertia request
        @view_data = {}
        json = JSON.parse(params[:json])
        @props = json["props"]
        @component = json["component"]
      end
    end
  end

  def inertia_wrap_render(render)
    @_inertia_render_wrapper = InertiaRenderWrapper.new.wrap_render(render)
  end

  def inertia
    assert @_inertia_render_wrapper, "The test never created an Inertia renderer. Maybe the code wasn't able to reach a `render inertia:` call?"

    @_inertia_render_wrapper
  end

  def install_inertia_test_renderer(&)
    new_renderer = InertiaRails::Renderer.method(:new)

    new_stub = ->(component, controller, request, response, render, named_args) do
      new_renderer.(component, controller, request, response, inertia_wrap_render(render), **named_args)
    end

    InertiaRails::Renderer.stub(:new, new_stub, &)
  end

  # Assertions

  def assert_props(**expected_props)
    assert_equal expected_props, inertia.props, "Received unexpected inertia props"
  end

  def assert_includes_props(**expected_props)
    assert_includes expected_props, inertia.props, "Inertia props do not include expected props"
  end

  def assert_prop_equals(prop_name, expected_value)
    assert inertia.props.key?(prop_name), "Inertia props do not include expected prop '#{prop_name}'"
    assert_equal expected_value, inertia.props[prop_name], "Inertia prop '#{prop_name}' does not match expected value"
  end

  def assert_component_rendered(expected_component)
    assert_equal expected_component, inertia.component, "Unexpected component rendered with inertia"
  end

  def assert_view_data(**expected_view_data)
    assert_equal expected_view_data, inertia.view_data, "Received unexpected inertia view data"
  end

  def assert_includes_view_data(**expected_view_data)
    assert_includes expected_view_data, inertia.view_data, "Inertia view data does not include expected view data"
  end
end

ActiveSupport.on_load(:action_dispatch_integration_test) { prepend InertiaHelper::TestWrapper }
