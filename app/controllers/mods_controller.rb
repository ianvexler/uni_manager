class ModsController < ApplicationController
    def new
        if !session[:logged_in] || session[:logged_in].nil?
            redirect_to login_path, flash: {alert: ["You need to be logged in"]}
        end
    end

    def single
    end

    def create
        mod_username = session[:user_username]
        mod_code = params[:code]
        mod_name = params[:name]
        mod_year = params[:year]

        Mod.create(username: mod_username, code: mod_code, module_name: mod_name, year: mod_year)

        redirect_to mods_path
    end
end