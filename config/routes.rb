Rails.application.routes.draw do
  resources :categories
  resources :items
  root 'items#index'
end
