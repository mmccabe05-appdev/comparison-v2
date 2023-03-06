Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "index" })
  get("/find_comparison", { :controller => "application", :action => "find_comparison" })
  #'comparisons#top'

  get("/comparisons/:id/upvote", { :controller => "comparisons", action: "upvote"})
  get("/comparisons/:id/downvote", { :controller => "comparisons", action: "downvote"})

  get("/users/:username/", { :controller => "application", action: "profile"})


  # root "comparisons#index"

  get("/comparisons/top")
  get("/comparisons/worst")

  resources :favorite_neighborhoods
  resources :neighborhoods
  resources :cities
  resources :comments
  resources :likes
  resources :comparisons
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
