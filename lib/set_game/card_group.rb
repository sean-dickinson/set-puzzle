module SetGame
  CardGroup = Data.define(:cards) do
    include Comparable
    class << self
      def from(cards)
        new(cards.map { Card.from(it) })
      end
    end

    def is_set?
      valid_counts.include?(count_pair)
    end

    def ==(other)
      return false unless other.is_a? CardGroup

      same_size = cards.size == other.cards.size
      same_cards = (cards - other.cards).empty?
      same_size && same_cards
    end
    alias eql? ==

    def to_s
      cards.sort.to_s
    end
    alias inspect to_s

    def <=>(other)
      to_s <=> other.to_s
    end

    private

    def count_pair
      tally = AttributeTally.from_cards(cards)
      [ tally.constant_count, tally.unique_count ]
    end

    def valid_counts
      [
        [ 0, 4 ], # all attributes are different
        [ 1, 3 ], # one attribute is the same, the other three are unique
        [ 2, 2 ], # two attributes are the same, the other two are unique
        [ 3, 1 ] # three attributes are the same, one is unique
      ]
    end
  end
end
