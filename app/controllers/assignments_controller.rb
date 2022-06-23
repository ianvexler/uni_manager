class AssignmentsController < ApplicationController
    def view
        if !session[:logged_in] || session[:logged_in].nil?
            redirect_to login_path, flash: {alert: ["You need to be logged in"]}
        end

        
    end
end
