# app/controllers/blogs_controller.rb
class BlogsController < ApplicationController
  before_action :set_blog_post, only: %i[show edit update destroy]
  before_action :authenticate_admin, except: %i[index show]

  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog = BlogPost.find(params[:id])
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to blog_url(@blog_post), notice: 'Blog post was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to blog_path(@blog_post.id), notice: 'Blog post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy
    redirect_to blogs_url, notice: 'Blog post was successfully destroyed.'
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to blogs_path
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end

  def authenticate_admin
    if session[:user_id] and User.find(session[:user_id]).is_admin?
      @current_user = User.find(session[:user_id])
    else
      redirect_to blogs_path, alert: 'Only admins can access this'
    end
  end

end

