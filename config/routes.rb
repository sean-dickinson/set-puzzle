Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  root to: "home#index"
  get "home/index"
  get "up" => "rails/health#show", as: :rails_health_check
  if Rails.env.local?
    resources :card_previews, only: %i[index]
  end

  resources :puzzles, only: %i[show], param: :date
  get "daily-puzzle", to: "puzzles#show", as: :daily_puzzle
end
