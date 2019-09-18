Rails.application.routes.draw do

  get '/' => 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post 'signup' => 'users#create'

  resources :captures
  resources :pokemons
  resources :regions
  resources :users

end
