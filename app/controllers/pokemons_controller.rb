class PokemonsController < ApplicationController
    before_action :set_pokemon, only:[:show, :edit, :update]
    before_action :redirect_if_not_logged_in

    def new
        @pokemon = Pokemon.new
        @pokemon.build_region
    end

    def create
        @pokemon = Pokemon.new(pokemon_params)
        @pokemon.region = Region.find_or_create_by(name: pokemon_params[:region_attributes][:name])
        @pokemon.user_id = session[:user_id]
        if @pokemon.save
          redirect_to pokemon_path(@pokemon)
        else
          render :new
        end
    end

    def index
        @pokemons = Pokemon.all
    end

    def show
    end

    def edit
    end

    def update
        if @pokemon.update(pokemon_params)
            redirect_to pokemon_path(@pokemon)
        else
            render :edit
        end
    end

    private

    def pokemon_params
        params.require(:pokemon).permit(:name, :description, :region_id, region_attributes: [:name])
    end

    def set_pokemon
        @pokemon = Pokemon.find_by_id(params[:id])
        redirect_to pokemons_path if !@pokemon
     end

end