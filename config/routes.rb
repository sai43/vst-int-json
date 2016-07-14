Rails.application.routes.draw do
  devise_for :sellers
  resources :categories
  resources :items
  get 'sold_items' => 'items#sold_items' 
  get 'category_items' => 'items#category_items'
  root 'items#index'
end
