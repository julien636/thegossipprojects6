Rails.application.routes.draw do

  get '/index', to: 'main_controller#index'
  get '/team', to: 'main_controller#team'
  get '/contact', to: 'main_controller#contact'
  get '/welcome/:id', to:'main_controller#welcome'
  get '/home', to: 'main_controller#home' 
  resources :gossips do
    resources :comments
  end
  resources :users
  resources :cities
  
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
