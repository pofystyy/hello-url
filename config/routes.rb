Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users
  root 'hellos#index'
  resources :hellos do
  	collection do
  		get :my_links
  	end
  end
  resources :tags
  end
