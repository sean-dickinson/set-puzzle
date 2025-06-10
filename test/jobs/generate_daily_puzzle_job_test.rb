require "test_helper"

class GenerateDailyPuzzleJobTest < ActiveJob::TestCase
  test "it generates a puzzle and saves it to the database" do
    current_date = Time.current.to_date
    freeze_time do
      assert_difference -> {Puzzle.count}, 1 do
        GenerateDailyPuzzleJob.perform_now
      end

      puzzle = Puzzle.last
      assert_not_nil puzzle, "Puzzle should be created"
      assert_equal current_date, puzzle.date, "Puzzle should have today's date"
      assert_equal 12, puzzle.cards.size, "Puzzle should have 12 cards"
    end


  end
end
