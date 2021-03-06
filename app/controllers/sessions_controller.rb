class SessionsController < ApplicationController

    def index
      @pokemon = Pokemon.all.sample
    end

    def new
    end

    def create
        if params[:provider] == 'google_oauth2'
          @user = User.create_by_google(auth)
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        elsif params[:provider] == 'facebook'
          @user = User.create_by_facebook(auth)
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          @user = User.find_by(username: params[:user][:username])
          if @user.try(:authenticate, params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            flash[:error] = "Sorry, login info was incorrect. Please try again."
            redirect_to login_path
          end
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    private

    def auth
      request.env['omniauth.auth']
    end
            
end
