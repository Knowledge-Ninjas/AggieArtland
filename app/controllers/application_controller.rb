class ApplicationController < ActionController::Base
    def navbar
        @user = User.find_by(email: params[:session][:email])
    end
end
