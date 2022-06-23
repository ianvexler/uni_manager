class GradesController < ApplicationController
    def view
        if !session[:logged_in] || session[:logged_in].nil?
            redirect_to login_path, flash: {alert: ["You need to be logged in"]}
        end
    end

    def create
        is_valid = true
        flash[:alert] = []

        @grade_username = session[:user_username]
        @grade_code = params[:code]
        @grade_name = params[:assignment_name]
        @grade_percentage = params[:grade_percentage]
        @grade_value = 0

        if params[:grade_value].present?
            @grade_value = params[:grade_value]
        end

        if !check_mod_params
            flash.now[:alert] << ["Invalid inputs"]
            is_valid = false
        end

        if !percentage_below_max
            flash.now[:alert] << ["The total percentage for this module exceeds 100%, please edit the percentages"]
            is_valid = false
        end

        if !check_name
            flash.now[:alert] << ["This assignment is already being used"]
            is_valid = false
        end

        if is_valid
            Grade.create(username: @grade_username, code: @grade_code, grade_name: @grade_name, grade_percentage: @grade_percentage, grade_value: @grade_value)
        end

        redirect_to grades_path
    end

    private
    def check_mod_params
        if params[:assignment_name].empty?
            return false
        end

        if params[:grade_percentage].empty?
            return false
        end

        if params[:grade_value].empty?
            return false
        end

        return true
    end

    # Checks that the pecentages are below 100%
    def percentage_below_max
        @grades = Grade.where(username: @grade_username, code: @grade_code)
        total_percentage = 0

        # Loops through all grades that match username and code
        # and adds the percentages
        @grades.all.each do |grade|
            total_percentage += grade.grade_percentage.to_i
        end

        total_percentage += @grade_percentage.to_i

        # Checks if total percentage sum is greater than 100
        if total_percentage > 100
            return false
        else
            return true
        end
    end

    def check_name 
        if Grade.where(username: @grade_username, code: @grade_code, grade_name: @grade_name).any?
            return false
        end
        
        return true
    end

    def check_grade_params
        if !params[:assignment_name].present?
            return false
        end

        if !params[:grade_percentage].present?
            return false
        end

        true
    end
end