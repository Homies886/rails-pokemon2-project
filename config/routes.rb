Rails.application.routes.draw do

  get '/' => 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post 'signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  resources :captures
  resources :pokemons do
    resources :captures, only: [:new, :index]
  end
  resources :regions
  resources :users

end
