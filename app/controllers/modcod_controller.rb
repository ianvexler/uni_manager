class ModcodController < ApplicationController
    def new
        @code = params[:code]
    end
end