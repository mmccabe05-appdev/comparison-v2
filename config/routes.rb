Rails.application.routes.draw do
  root "application#index"

  get "/find_comparison" => "application#find_comparison"

  get "/comparisons/:id/upvote" => "comparisons#upvote"
  get "/comparisons/:id/downvote" => "comparisons#downvote"
  get "/comparisons/top" => "comparisons#top"
  get "/comparisons/worst" => "comparisons#worst"

  get "/users/top/" => "application#top_users"
  
  devise_for :users

  get "/users/:username/" => "application#profile"




  resources :favorite_neighborhoods
  resources :neighborhoods, only: %i[index show]
  resources :cities, only: %i[index show]
  resources :comments
  resources :likes, only: %i[]
  resources :comparisons
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
