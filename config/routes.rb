Rails.application.routes.draw do
  resources :todos
  resources :users
  get "/" => "home#index"
  post "users/login", to: "users#login"
end
