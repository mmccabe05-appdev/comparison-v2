Rails.application.routes.draw do
  root "cities#index"
  resources :favorite_neighborhoods
  resources :neighborhoods
  resources :cities
  resources :comments
  resources :likes
  resources :comparisons
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
