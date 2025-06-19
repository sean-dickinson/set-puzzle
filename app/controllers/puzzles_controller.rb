class PuzzlesController < ApplicationController
  def show
    puzzle = Puzzle.find_by(date: date_param)
    render inertia: "PuzzleShow", props: { puzzle: puzzle.as_json }
  end

  private

  def date_param
    params.expect(:date)
  end
end
