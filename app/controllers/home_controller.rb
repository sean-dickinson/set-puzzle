class HomeController < ApplicationController
  allow_unauthenticated_access
  def index
    render inertia: "Home/Index", props: {
      today:,
      past:
    }
  end

  private

  def today
    create_today_if_needed!
    Puzzle.find_by!(date: Date.current.to_s).to_preview
  end

  def past
    Puzzle.where("date < ?", Date.current)
          .order(date: :desc)
          .limit(5)
          .map(&:to_preview)
  end

  def create_today_if_needed!
    return unless Rails.env.local?

    GenerateDailyPuzzleJob.perform_now unless Puzzle.find_by(date: Date.current.to_s).present?
  end
end
