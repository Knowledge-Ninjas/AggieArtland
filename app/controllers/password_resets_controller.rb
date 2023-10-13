class PasswordResetsController < ApplicationController

    def new
    end

    def create
        if params[:email].empty?
            redirect_to password_reset_path, alert: "Email can't be blank."
            return
        elsif !valid_email?(params[:email])
            redirect_to password_reset_path, alert: "Invalid email format. Please enter a valid email address."
            return
        end
        @user =User.find_by(email: params[:email])
        
        if @user.present?
            PassswordMailer.with(user:@user).reset.deliver_now 
        end
        redirect_to root_path, notice: "If an account with email was found, we have sent a link to reset your password."

    end

    def valid_email?(email)
        # Regular expression for matching email addresses
        email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      
        # Use the match? method to check if the string matches the email regex
        email.match?(email_regex)
    end
end