Rails.application.routes.draw do
  devise_for :users
  root 'hellos#index'
  resources :hellos
  resources :tags
  end
