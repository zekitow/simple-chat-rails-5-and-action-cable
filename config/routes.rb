Rails.application.routes.draw do
  devise_for :users
  resources :rooms, only: [:new, :create, :show, :index]

  root 'rooms#index'
end
