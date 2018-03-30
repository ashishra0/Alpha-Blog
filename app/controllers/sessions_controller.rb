class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "You have successfully logged in"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "Failed to Log in"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:danger] = "Successfully logged out"
        redirect_to root_path
    end
end