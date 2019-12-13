class PokemonsController < ApplicationController

    def new
        @pokemon = Pokemon.new
        @pokemon.build_region
    end

    def create
        @pokemon = Pokemon.new(pokemon_params)
        @pokemon.user_id = session[:user_id]
        if @pokemon.save
          redirect_to poekmon_path(@pokemon)
        else
          render :new
        end
    end

    def index
        @pokemons = Pokemon.all
    end

    def show
        @pokemon = Pokemon.find_by_id(params[:id])
    end

    private

    def pokemon_params
        params.require(:pokemon).permit(:name, :description, :region_id, region_attributes: [:name])
    end

end