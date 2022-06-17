module GradesHelper
    # Calculates the total percentage over 100%
    # Maybe do this somewhere else
    def calculate_percent_max
        @grades = Grade.where(username: @grade_username, code: @grade_code)

        @grades.all.each do |grade|
            ((grade.percentage) / 100)
        end
    end

    # Calculates the total percentage relative to the total percentage
    def calculate_percent_relative
        @grades = Grade.where(username: @grade_username, code: @grade_code)
    end
end

# @grade_username = session[:user_username]
# @grade_code = params[:code]
# @grade_name = params[:assignment_name]
# @grade_percentage = params[:grade]

# MISSING ACTUAL GRADE ON DATABASE GRADESSS !!!!!!!!!