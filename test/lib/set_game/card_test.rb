# frozen_string_literal: true

require "test_helper"

class SetGame::CardTest < ActiveSupport::TestCase
  test "it can be created with valid attributes" do
    card = SetGame::Card.new(shape: :diamond, color: :red, number: 2, shade: :solid)
    assert_equal :diamond, card.shape
    assert_equal :red, card.color
    assert_equal 2, card.number
    assert_equal :solid, card.shade
  end

  test "it can be converted to a string" do
    multiple_card = SetGame::Card.new(shape: :diamond, color: :red, number: 2, shade: :solid)
    singular_card = SetGame::Card.new(shape: :oval, color: :red, number: 1, shade: :solid)
    assert_equal "2 solid red diamonds", multiple_card.to_s
    assert_equal "1 solid red oval", singular_card.to_s
  end

  test "it can be created from a string" do
    card = SetGame::Card.from("2 solid red diamonds")
    assert_equal :diamond, card.shape
    assert_equal :red, card.color
    assert_equal 2, card.number
    assert_equal :solid, card.shade
  end

  test "it can be created from a json hash" do
    card = SetGame::Card.from({ shape: "diamond", color: "red", number: 2, shade: "solid" })
    assert_equal :diamond, card.shape
    assert_equal :red, card.color
    assert_equal 2, card.number
    assert_equal :solid, card.shade
  end

  test "it is comparable based on attributes" do
    card1 = SetGame::Card.new(shape: :diamond, color: :red, number: 2, shade: :solid)
    card2 = SetGame::Card.new(shape: :diamond, color: :red, number: 2, shade: :solid)
    card3 = SetGame::Card.new(shape: :oval, color: :red, number: 2, shade: :solid)
    assert_equal card1, card2
    refute_equal card1, card3
  end

  test "array difference works as expected" do
    card1 = SetGame::Card.new(shape: :diamond, color: :red, number: 2, shade: :solid)
    card2 = SetGame::Card.new(shape: :oval, color: :red, number: 2, shade: :solid)
    card3 = SetGame::Card.new(shape: :squiggle, color: :red, number: 2, shade: :solid)
    cards = [ card1, card2, card3 ]
    diff = cards - [ card2 ]
    assert_equal [ card1, card3 ], diff
  end
end
