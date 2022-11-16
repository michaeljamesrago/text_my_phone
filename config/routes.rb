Rails.application.routes.draw do
  get 'phone_numbers/new'
  root "messages#index"
  get "sessions/new"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :messages
  resources :users do
    resources :phone_numbers
  end
end
