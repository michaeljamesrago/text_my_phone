Rails.application.routes.draw do
  get 'phone_number_verifications/new'
  root "sessions#new"
  get "sessions/new"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users do
    resources :phone_numbers do
      resources :messages
    end
  end
  resources :account_activations, only: [:edit]
  resources :phone_number_verifications, only: [:new, :update]
end
