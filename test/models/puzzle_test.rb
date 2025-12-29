# frozen_string_literal: true

require "test_helper"

class PuzzleTest < ActiveSupport::TestCase
  test "cards are cast correctly wne set" do
    cards = [
      SetGame::Card.new(shape: :diamond, color: :red, number: 2, shade: :solid),
      SetGame::Card.new(shape: :oval, color: :green, number: 1, shade: :striped)
    ]
    puzzle = Puzzle.new(cards:)
    assert_equal cards, puzzle.cards
    assert cards.all? { |card| card.is_a?(SetGame::Card) }
  end

  test "sets returns the sets as CardGroups" do
    sets = [
      [ "1 striped red oval", "2 solid red ovals", "3 open red ovals" ],
      [ "1 open purple oval", "2 open green ovals", "3 open red ovals" ],
      [ "2 solid green diamonds", "2 solid purple diamonds", "2 solid red diamonds" ],
      [ "1 striped red squiggle", "2 solid red ovals", "3 open red diamonds" ],
      [ "1 striped red squiggle", "2 open red squiggles", "3 solid red squiggles" ],
      [ "1 striped red squiggle", "2 solid red diamonds", "3 open red ovals" ]
    ].map { |set| set.map { SetGame::Card.from(it) } }
     .map { |cards| SetGame::CardGroup.new(cards) }

    puzzle = Puzzle.new(cards: sets.flat_map(&:cards).uniq)

    assert_equal sets.sort_by(&:to_s), puzzle.sets.sort_by(&:to_s)
    assert puzzle.sets.all? { |set| set.is_a?(SetGame::CardGroup) }
    assert puzzle.sets.all? { |set| set.is_set? }
  end
end
