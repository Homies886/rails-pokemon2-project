Rails.application.routes.draw do
  resources :captures
  resources :pokemons
  resources :regions
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
