class PokemonsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @pokemon = Pokemon.new
        @pokemon.build_region
    end

    def create
        @pokemon = Pokemon.new(pokemon_params)
        @pokemon.region = Region.find_or_create_by(pokemon_params[:region_attributes][name: :name])
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
        @pokemon = Pokemon.find_by_id(params[:id])
    end

    private

    def pokemon_params
        params.require(:pokemon).permit(:name, :description, :region_id, region_attributes: [:name])
    end

end