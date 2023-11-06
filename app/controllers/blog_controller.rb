class BlogController < ApplicationController
  
def new
    #@user = User.find(params[:id])
end
    

  def show
    #@user = User.find(params[:id])
  end

  def edit
    #@user = User.find(params[:id])
  end

  def update
    
    #@user = User.find(params[:id])
    #puts user_params
    #if @user.update(user_params)
    #  redirect_to profile_path, notice: 'Name updated successfully'
    #else
    #  render 'edit'
    #end
    
  end
  private

  def authenticate_user
    # Implement your authentication logic here
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      redirect_to login_path, alert: 'Please log in.'
    end
  end

  #def user_params
   # params.require(:user).permit(:name)
  #end
end
