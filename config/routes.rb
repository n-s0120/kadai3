Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to:"homes#top"
  get "homes/about"
  resources :books, only: [:new, :create, :index, :show, :destroy]
  post "users/sign_up" => "users/show"
end