class CapturesController < ApplicationController

    def new
        Pokemon.find_by_id(params[:pokemon_id])
        @capture = @pokemon.captures.build
    end

    def index
    end
    
end
