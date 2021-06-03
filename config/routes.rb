Rails.application.routes.draw do
  resources :todos
  resources :users
  get "/" => "home#index"
end
