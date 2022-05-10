class PostsController < ApplicationController
  before_action :set_post!, only: %i[destroy update edit show]
  def index
    @posts = Post.order(created_at: :desc)
  end

  def create
    @post = Post.new post_params
    if @post.save 
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end
  
  def destroy
    @post.destroy
    redirect_to root_path
  end
  
  def update
    if @post.update post_params
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def edit ; end
  

  def show ; end

  private
  
  def post_params
    params.require(:post).permit(:author,:description, :photo, :title)
  end

  def set_post!
    @post = Post.find params[:id]
  end
end
