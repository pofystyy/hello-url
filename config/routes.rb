Rails.application.routes.draw do
  root 'hellos#index'
  resources :hellos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
