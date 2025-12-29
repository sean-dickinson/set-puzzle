require "test_helper"

class PuzzleCompletionTest < ActiveSupport::TestCase
  def setup
    @sets = [
      [ "1 striped red oval", "2 solid red ovals", "3 open red ovals" ],
      [ "1 open purple oval", "2 open green ovals", "3 open red ovals" ],
      [ "2 solid green diamonds", "2 solid purple diamonds", "2 solid red diamonds" ],
      [ "1 striped red squiggle", "2 solid red ovals", "3 open red diamonds" ],
      [ "1 striped red squiggle", "2 open red squiggles", "3 solid red squiggles" ],
      [ "1 striped red squiggle", "2 solid red diamonds", "3 open red ovals" ]
    ].map { SetGame::CardGroup.from(it) }
    @cards = @sets.flat_map(&:cards).uniq
    @puzzle = Puzzle.new(cards: @cards, date: Date.today)
  end

  test "it is not valid if the sets are empty" do
    completion = PuzzleCompletion.new(sets: [], puzzle: @puzzle)
    refute completion.valid?
    assert completion.errors.include? :sets
  end

  test "is not valid if any set is not a valid set" do
    sets = @sets.dup
    # replace the first set with an invalid set
    sets[0] = SetGame::CardGroup.from([ "1 striped red oval", "1 open purple oval", "2 solid green diamonds" ])
    completion = PuzzleCompletion.new(sets:, puzzle: @puzzle)
    refute completion.valid?
    assert completion.errors.include? :sets
  end

  test "it is not valid if there are sets that are not part of the puzzle" do
    extra_set = SetGame::CardGroup.from([ "1 solid red diamond", "2 solid red diamond", "3 solid red diamond" ])
    sets = [
      extra_set,
      *@sets[...-1]
    ]
    completion = PuzzleCompletion.new(sets:, puzzle: @puzzle)
    refute completion.valid?
    assert completion.errors.include? :sets
  end

  test "it is valid if all sets are valid and part of the puzzle" do
    completion = PuzzleCompletion.new(sets: @sets, puzzle: @puzzle, user: User.new)
    assert completion.valid?
  end
end
