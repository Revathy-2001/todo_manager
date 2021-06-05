Rails.application.routes.draw do
  resources :todos
  resources :users
  get "/" => "home#index"
  post "users/login", to: "users#login"
  get "signin" => "sessions#new", as: :new_sessions
  post "signin" => "sessions#create", as: :sessions
end
