Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :puzzles, only: %i[show], param: :date
  get "daily-puzzle", to: "puzzles#show", defaults: { date: Time.current.to_date }, as: :daily_puzzle
end
