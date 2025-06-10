class GenerateDailyPuzzleJob < ApplicationJob
  queue_as :default

  def perform
    cards = SetGame::PuzzleGenerator.new.generate
    Puzzle.create!(
      cards:,
      date: Time.current.to_date
    )
  end
end
