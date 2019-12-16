class CapturesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @pokemon = Pokemon.find_by_id(params[:pokemon_id])
        @capture = @pokemon.captures.build
    end

    def create
        @capture = current_user.captures.build(capture_params)
        if @capture.save
            redirect_to capture_path(@capture)
        else
            render :new
        end
    end

    def show
        @capture = Capture.find_by_id(params[:id])
    end

    def index
        if @pokemon = Pokemon.find_by_id(params[:pokemon_id])
            @captures = @pokemon.captures
        else
            @captures = Capture.all
        end
    end

    private

    def capture_params
        params.require(:capture).permit(:pokemon_id, :pokeball, :captured)
    end
    
end
