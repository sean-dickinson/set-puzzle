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

  test "it correctly identifies a valid set when all attributes are different" do
    cards = [
      "1 striped red oval",
      "2 solid purple squiggles",
      "3 open green diamonds"
    ]
    card_group = SetGame::CardGroup.from(cards)
    assert card_group.is_set?
  end

  test "it correctly identifies a valid set when all but 1 attribute is the same" do
    cards = [
      "2 solid red diamonds",
      "2 solid red ovals",
      "2 solid red squiggles"
    ]
    card_group = SetGame::CardGroup.from(cards)
    assert card_group.is_set?
  end

  test "it correctly identifies a valid set when all but 2 attribute are the same" do
    cards = [
      "3 open green ovals",
      "3 open green diamonds",
      "3 open green squiggles"
    ]
    card_group = SetGame::CardGroup.from(cards)
    assert card_group.is_set?
  end

  test "it correctly identifies a valid set when all but 3 attribute are the same" do
    cards = [
      "1 open green ovals",
      "2 solid green diamonds",
      "3 striped green squiggles"
    ]
    card_group = SetGame::CardGroup.from(cards)
    assert card_group.is_set?
  end

  test "it correctly identifies an invalid set" do
    cards = [
      "1 striped red oval",
      "1 solid red oval",
      "2 open red oval"
    ]
    card_group = SetGame::CardGroup.from(cards)
    refute card_group.is_set?
  end
end
