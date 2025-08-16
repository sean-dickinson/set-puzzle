class HomeController < ApplicationController
  def index
    render inertia: "Home/Index", props: {
      current_puzzle:
    }
  end

  private

  def current_puzzle
    puzzle = Puzzle.find_by!(date: Date.current.to_s)

    {
      card: puzzle.cards.first,
      date: puzzle.date.to_s
    }
  end
end
