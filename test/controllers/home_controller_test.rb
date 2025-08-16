require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    freeze_time do
      cards = SetGame::DeckBuilder.new.build_deck.sample(12)
      expected_card = cards.first.as_json
      Puzzle.create!(cards:, date: Date.current.to_s)

      get home_index_url

      assert_response :success
      assert_props current_puzzle: { card: expected_card, date: Date.current.to_s }
    end
  end
end
