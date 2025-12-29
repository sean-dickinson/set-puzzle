# frozen_string_literal: true

module SetGame
  ATTRIBUTES = %i[color shape number shade].freeze
  CARDS_IN_SET = 3

  class << self
    def singluarize(attribute)
      attribute.to_s.chomp("s")
    end

    # @param count [Integer] the count of items
    # @param attribute [String, Symbol] the attribute to pluralize
    def pluralize(count, attribute)
      if count > 1
        "#{attribute}s"
      else
        attribute
      end
    end
  end
end
