class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to login_path, notice: "User created"
        else
            render :new
        end
    end

    # Method that returns the user parameters from the post form  
    private
    def user_params
        params.required(:user).permit(:username, :email, :password, :password_confirmation)
    end
end