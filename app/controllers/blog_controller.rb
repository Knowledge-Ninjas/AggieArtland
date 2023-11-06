class BlogController < ApplicationController
  
def new
    #@user = User.find(params[:id])
end

def index
    @blog_posts = BlogPost.all
end
    

  def show
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to blog_index_path
  end

  def edit
    
  end

  def update
    
    
    
  end
  private

  def authenticate_user
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
