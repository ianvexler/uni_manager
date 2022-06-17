module GradesHelper
    # Calculates the total percentage over 100%
    # Maybe do this somewhere else
    def calculate_percent_max (g_username, g_code)
        grades = get_grades(g_username, g_code)
        total_for_value = get_values_available(g_username, g_code)

        # Returns the percentage times 100 to make it a whole number
        return (total_for_value * 100).round(2)
    end

    # Calculates the total percentage relative to the total percentage
    def calculate_percent_relative (g_username, g_code)
        grades = get_grades(g_username, g_code)
        total_for_value = get_values_available(g_username, g_code)
        total_for_percentage = get_percentage_available(g_username, g_code)

        return ((total_for_value / total_for_percentage) * 100).round(2)
    end

    # Method that gets the grades for a username and module code
    def get_grades (g_username, g_code)
        return Grade.where(username: g_username, code: g_code) 
    end

    # Adds the total values
    def get_values_available (g_username, g_code)
        grades = get_grades(g_username, g_code)
        total_for_value = 0

        grades.all.each do |grade|
            total_for_value += ((grade.grade_value).to_f / 100) * ((grade.grade_percentage).to_f / 100)
        end

        return total_for_value
    end

    # Adds the total percentages
    def get_percentage_available (g_username, g_code)
        grades = get_grades(g_username, g_code)
        total_for_percentage = 0

        grades.all.each do |grade|
            total_for_percentage += (grade.grade_percentage).to_f / 100
        end

        return total_for_percentage
    end
end