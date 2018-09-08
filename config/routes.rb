Rails.application.routes.draw do
  root 'hellos#index'
  resources :hellos
  resources :tags
  end
