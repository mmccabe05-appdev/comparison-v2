Rails.application.routes.draw do
  resources :neighborhoods
  resources :cities
  resources :comments
  resources :likes
  resources :comparisons
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
