class PokemonsController < ApplicationController

    def new
        @pokemon = Pokemon.new
        @pokemon.build_region
    end

    def create
        @pokemon = Pokemon.new(pokemon_params)
    
        if @pokemon.save
          redirect_to @pokemon
        else
          render :new
        end
    end

    private

    def pokemon_params
        params.require(:pokemon).permit(:name, :description, :region_id, region_attributes: [:name])
    end

end