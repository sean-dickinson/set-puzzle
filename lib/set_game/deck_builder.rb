module SetGame
  class DeckBuilder
    SHAPES = %i[diamond squiggle oval].freeze
    COLORS = %i[red green purple].freeze
    NUMBERS = (1..3).to_a.freeze
    SHADES = %i[solid striped open].freeze

    def build_deck
      SHAPES.product(COLORS, NUMBERS, SHADES).map do |shape, color, number, shade|
        Card.new(shape:, color:, number:, shade:)
      end
    end
  end
end
