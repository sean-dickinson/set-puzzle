# frozen_string_literal: true

require "test_helper"

class CardGroupTest < ActiveSupport::TestCase
  test "it can be created from an array of cards" do
    cards = [
      SetGame::Card.new(shape: :diamond, color: :red, number: 2, shade: :solid),
      SetGame::Card.new(shape: :oval, color: :green, number: 1, shade: :striped),
      SetGame::Card.new(shape: :squiggle, color: :purple, number: 3, shade: :open)
    ]
    card_group = SetGame::CardGroup.from(cards)
    assert_same_elements cards, card_group.cards
  end

  test "it can be created from an array of card strings" do
    card_strings = [
      "2 solid red diamonds",
      "1 striped green oval",
      "3 open purple squiggles"
    ]
    card_group = SetGame::CardGroup.from(card_strings)
    expected_cards = card_strings.map { |str| SetGame::Card.from(str) }
    assert_same_elements expected_cards, card_group.cards
  end
end
