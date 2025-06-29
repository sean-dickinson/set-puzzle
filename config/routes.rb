Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  if Rails.env.local?
    resources :card_previews, only: %i[index]
  end

  resources :puzzles, only: %i[show], param: :date
  get "daily-puzzle", to: "puzzles#show", defaults: { date: Time.current.to_date }, as: :daily_puzzle
end
