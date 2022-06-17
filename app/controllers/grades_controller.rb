class GradesController < ApplicationController
    def new
        @grade_username = session[:user_username]
    end

    def create
        @grade_code = params[:code]
        @grade_name = params[:assignment_name]
        @grade_percentage = params[:grade]

        if percentage_below_max
            Grade.create(username: @grade_username, code: @grade_code, grade_name: @grade_name, grade_percentage: @grade_percentage)
        else
            # Maybe flash?
        end

        redirect_to grades_path
    end

    # Checks that the pecentages are below 100%
    def percentage_below_max
        @grades = Grade.where(username: @grade_username, code: @grade_code)
        total_percentage = 0

        # Loops through all grades that match username and code
        # and adds the percentages
        @grades.all.each do |grade|
            total_percentage += grade.grade_percentage
        end

        # Checks if total percentage sum is greater than 100
        if total_percentagae > 100
            return false
        else
            return true
        end
    end
end