class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            session[:user_username] = user.username
            session[:user_email] = user.email
            session[:logged_in] = true

            redirect_to root_path, notice: "Logged in succesfully"
        else
            flash[:alert] = "Invalid inputs"
            render :new 
        end
    end

    def delete
        session[:user_id] = nil
        session[:user_username] = nil
        session[:user_email] = nil
        session[:logged_in] = nil

        redirect_to root_path, notice: "Logged out successfully"
    end
end