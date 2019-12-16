class CapturesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        if @pokemon = Pokemon.find_by_id(params[:pokemon_id])
            @capture = @pokemon.captures.build
        else
            @capture = Capture.new
        end
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
            @captures = Capture.order_by_date_captured
        end
    end

    private

    def capture_params
        params.require(:capture).permit(:pokemon_id, :pokeball, :captured)
    end
    
end
