module SetGame
  class PuzzleGenerator
    def initialize(deck_builder: DeckBuilder.new)
      @cards = deck_builder.build_deck
    end

    # @return [Enumerable<Card>]
    def generate
      all_puzzles.find(&method(:valid?))
    end

    private

    def all_puzzles
      @cards.shuffle.combination(12).lazy
    end

    def valid?(cards)
      cards.combination(3).count { |maybe_set| CardGroup.new(maybe_set).is_set? } == 6
    end
  end
end
