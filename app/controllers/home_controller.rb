class HomeController < ApplicationController
  def index
    render inertia: "Home/Index", props: {
      today:,
      past:
    }
  end

  private

  def today
    Puzzle.find_by!(date: Date.current.to_s).to_preview
  end

  def past
    Puzzle.where("date < ?", Date.current)
          .order(date: :desc)
          .limit(5)
          .map(&:to_preview)
  end
end
