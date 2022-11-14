Rails.application.routes.draw do
  get '/signup', to: "users#new"
  root "messages#index"
  resources :messages
  resources :users
end
