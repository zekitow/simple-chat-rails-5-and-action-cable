Rails.application.routes.draw do

  ####################################
  # Devise setup
  ####################################
  devise_for :users

  ####################################
  # Resources
  ####################################
  resources :rooms, only: [:new, :create, :show, :index]

  root 'rooms#index'


  ####################################
  # Action cable setup
  ####################################
  mount ActionCable.server => '/cable'
end
