class PuzzlesController < ApplicationController
  allow_unauthenticated_access
  def show
    puzzle = Puzzle.find_by(date: date_param)
    render inertia: "PuzzleShow", props: { puzzle: puzzle.as_json }
  end

  private

  def date_param
    params.tap do |p|
      p[:date] = p[:date].presence || Date.current.to_s
    end.expect(:date)
  end
end
