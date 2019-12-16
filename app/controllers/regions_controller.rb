class RegionsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @regions = Region.all
    end

    def new
        @region = Region.new
    end
    
end