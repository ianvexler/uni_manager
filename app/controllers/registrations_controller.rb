class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)

        is_valid = true
        flash[:alert] = []

        if !check_user_params
            flash[:alert] << ["Invalid inputs"]
        end

        if !check_username(params[:user][:username])
            flash[:alert] << ["Username already taken"]
            is_valid = false
        end

        if !check_email(params[:user][:email])
            flash[:alert] << ["Email already taken"]
            is_valid = false
        end
        
        if is_valid
            if @user.save
                redirect_to login_path
            else
                redirect_to sign_up_path
            end
        else 
            redirect_to sign_up_path
        end
    end

    def check_username (username)
        if User.where(username: username).any?
            return false
        end
        
        return true
    end

    def check_email (email)
        if User.where(email: email).any?
            return false
        end

        return true
    end

    # Checks that all parameters have been given
    private
    def check_user_params
        if !params[:user][:username].present?
            return false
        end

        if !params[:user][:email].present?
            return false
        end

        if !params[:user][:password].present?
            return false
        end

        if !params[:user][:email].present?
            return false
        end

        true
    end

    # Method that returns the user parameters from the post form  
    private
    def user_params
        params.required(:user).permit(:username, :email, :password, :password_confirmation)
    end
end