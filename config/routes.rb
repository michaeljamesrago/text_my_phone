Rails.application.routes.draw do
  root "hello#index"
  resources :messages
end
