Rails.application.routes.draw do
  devise_for :users
  get 'users/show'
  root to:"homes#top"
  get "homes/about"
  resources :users
  resources :books, only: [:new, :create, :index, :show, :destroy]
end