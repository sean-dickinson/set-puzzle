require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index with today's card" do
    freeze_time do
      puzzle = create_puzzle(Date.current.to_s)
      expected_card = puzzle.cards.first.as_json

      get home_index_url

      assert_response :success
      assert_prop_equals :today, { id: puzzle.id, card: expected_card, date: Date.current.to_s }
    end
  end

  test "should get index with last 5 days puzzles" do
    freeze_time do
      # Today's puzzle
      create_puzzle(Date.current.to_s)
      # Past 5 days' puzzles
      puzzles = (1..5).map do |i|
        date = Date.current - i.days
        create_puzzle(date.to_s)
      end

      expected_puzzles = puzzles.map do
        {
          id: it.id,
          date: it.date.to_s,
          card: it.cards.first.as_json
        }
      end.to_a

      get home_index_url

      assert_response :success
      assert_prop_equals :past, expected_puzzles
    end
  end

  def create_puzzle(date)
    cards = SetGame::DeckBuilder.new.build_deck.sample(12)
    Puzzle.create!(cards:, date:)
  end
end
