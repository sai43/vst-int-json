Rails.application.routes.draw do
  devise_for :sellers
  resources :categories
  resources :items
  root 'items#index'
end
