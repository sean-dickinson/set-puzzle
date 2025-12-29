# frozen_string_literal: true

module ArrayHelper
  def assert_same_elements(expected, actual, message = nil)
    message ||= "Expected arrays to have the same elements, but they differ.\nExpected: #{expected.inspect}\nActual: #{actual.inspect}"
    assert_equal expected.sort, actual.sort, message
  end
end
