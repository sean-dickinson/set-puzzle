module SetGame
  AttributeTally = Data.define(*ATTRIBUTES) do
    class << self
      def from_cards(cards)
        tallies = ATTRIBUTES.each_with_object({}) do |attribute, hash|
          hash[attribute] = cards.map(&attribute).tally
        end

        new(**tallies)
      end
    end

    def constant_count = ATTRIBUTES.count(&method(:is_constant?))

    def unique_count = ATTRIBUTES.count(&method(:is_unique?))

    private

    def is_constant?(attribute) = send(attribute).keys.size == 1

    def is_unique?(attribute) = send(attribute).keys.size == CARDS_IN_SET
  end
end
