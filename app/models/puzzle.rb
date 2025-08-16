class Puzzle < ApplicationRecord
  def to_preview
    {
      id:,
      date: date.to_s,
      card: cards.first.as_json
    }
  end
end
