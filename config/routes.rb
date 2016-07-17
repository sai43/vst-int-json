Rails.application.routes.draw do
  devise_for :sellers
  resources :categories
  namespace :api do
     resources :items
     get 'sold_items' => 'items#sold_items' 
     get 'category_items' => 'items#category_items'
  end

  root 'items#index'
end
