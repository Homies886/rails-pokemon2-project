class CapturesController < ApplicationController

    def new
        Pokemon.find_by_id(params[:pokemon_id])
        @capture = @pokemon.build_capture
    end

    def index
    end
    
end
