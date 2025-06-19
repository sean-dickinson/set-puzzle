require "test_helper"

class PuzzlesControllerTest < ActionDispatch::IntegrationTest
  test "puzzles#show should render the puzzle show page with the puzzle data" do
    puzzle = Puzzle.create!(cards: [], date: Time.current.to_date)
    get puzzle_url(puzzle.date)
    assert_response :success
  end

  test "/daily-puzzle should render today's puzzle" do
    today = Time.current.to_date
    puzzle = Puzzle.create!(cards: [], date: today)

    get daily_puzzle_url

    assert_response :success
  end
end
