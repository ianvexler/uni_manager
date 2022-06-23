class ModsController < ApplicationController
    def index
        if !session[:logged_in] || session[:logged_in].nil?
            redirect_to login_path, flash: {alert: ["You need to be logged in"]}
        end
    end

    def create
        is_valid = true
        flash[:alert] = []

        @mod_username = session[:user_username]
        @mod_code = params[:code]
        @mod_name = params[:name]

        if !check_mod_params
            flash.now[:alert] << ["Invalid inputs"]
            is_valid = false
        end

        if !check_code
            flash.now[:alert] << ["This Code has already being used"]
            is_valid = false
        end

        if !check_name
            flash.now[:alert] << ["This Name has already being used"]
            is_valid = false
        end

        if is_valid
            Mod.create(username: @mod_username, code: @mod_code, module_name: @mod_name, year: @mod_year)
            redirect_to mods_path
        else
            render "index"
        end
    end

    def edit
        if !params[:code].empty?
            Mod.where(code: params[:og_code]).update_all(code: params[:code])
            Grade.where(code: params[:og_code]).update_all(code: params[:code])
        end

        if !params[:name].empty?
            Mod.where(module_name: params[:og_name]).update_all(module_name: params[:name])
            puts "here"
        end

        if !params[:year].empty?
            Mod.where(year: params[:og_year]).update_all(year: params[:year])
        end

        redirect_to mods_path
    end

    # Checks the parameters provided in the form
    private
    def check_mod_params
        if params[:code].empty?
            return false
        end

        if params[:name].empty?
            return false
        end

        if params[:year].empty?
            return false
        end

        return true
    end

    # Checks that the code is not present in the db for that username
    def check_code 
        if Mod.where(username: @mod_username, code: @mod_code).any?
            return false
        end
        
        return true
    end

    # Checks that the module name is not being used for that username
    def check_name 
        if Mod.where(username: @mod_username, code: @mod_name).any?
            return false
        end
        
        return true
    end

    # Checks that the year is not 0 which would be invalid
    def check_year
        if @mod_year == 0
            return false
        end

        return true
    end
end