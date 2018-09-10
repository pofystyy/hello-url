Rails.application.routes.draw do
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
