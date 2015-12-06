Rails.application.routes.draw do
  devise_for :users

  resources :evaluations

  get "terms" => "home#terms"
  get "privacy" => "home#privacy"

  root to: "home#index"
end

