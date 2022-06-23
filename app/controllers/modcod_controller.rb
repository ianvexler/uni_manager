class ModcodController < ApplicationController
    def index
        if !session[:logged_in] || session[:logged_in].nil?
            redirect_to login_path, flash: {alert: ["You need to be logged in"]}
        end

        @code = params[:code]
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

        render "index"
    end
end