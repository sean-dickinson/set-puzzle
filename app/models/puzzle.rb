class Puzzle < ApplicationRecord
  attribute :cards, SetGame::Types::CardArrayType.new

  def to_preview
    {
      id:,
      date: date.to_s,
      card: cards.first.as_json
    }
  end

  def sets
    cards.combination(3).map do |maybe_set|
      SetGame::CardGroup.from(maybe_set)
    end.select(&:is_set?)
  end
end
