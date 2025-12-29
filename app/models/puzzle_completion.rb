class PuzzleCompletion < ApplicationRecord
  belongs_to :user
  belongs_to :puzzle

  attribute :sets, SetGame::Types::CardGroupType.new

  validate :must_have_valid_sets

  private
  def must_have_valid_sets
    diff = puzzle.sets - sets
    errors.add(:sets, "Invalid sets for this puzzle") unless diff.empty?
  end
end
