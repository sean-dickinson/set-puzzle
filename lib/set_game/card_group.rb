module SetGame
  class CardGroup
    def initialize(cards)
      @attribute_tally = AttributeTally.from_cards(cards)
    end

    def is_set?
      valid_counts.include?(count_pair)
    end

    private

    def count_pair
      [@attribute_tally.constant_count, @attribute_tally.unique_count]
    end

    def valid_counts
      [
        [0, 4], # all attributes are different
        [1, 3], # one attribute is the same, the other three are unique
        [2, 2], # two attributes are the same, the other two are unique
        [3, 1] # three attributes are the same, one is unique
      ]
    end
  end
end
