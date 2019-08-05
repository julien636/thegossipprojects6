Rails.application.routes.draw do

  get '/team', to: 'main_controller#team'
  get '/contact', to: 'main_controller#contact'
  get '/welcome/:id', to:'main_controller#welcome'
  get '/index', to: 'main_controller#index'
  get '/gossips/:id', to: 'gossip#gdisplay' 
  resources :gossips, controller: 'gossip'
  get 'users/:id', to: 'user#udisplay'
  resources :users, controller: 'user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
