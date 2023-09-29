class UsersController < ApplicationController
  include ApplicationHelper
  before_action :require_login, only: [:show]

    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user, notice: 'User successfully created!'
      else
        render 'new'
      end
    end

    def show
      @user = User.find(params[:id])
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end

    def require_login
      unless logged_in?
        flash[:error] = 'You must be logged in to access this section.'
        redirect_to login_path
      end
    end
  end