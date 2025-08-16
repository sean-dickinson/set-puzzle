class HomeController < ApplicationController
  def index
    render inertia: "Home/Index", props: {
      today:
    }
  end

  private

  def today
    puzzle = Puzzle.find_by!(date: Date.current.to_s)

    {
      card: puzzle.cards.first,
      date: puzzle.date.to_s
    }
  end
end
