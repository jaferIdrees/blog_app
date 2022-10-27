class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = User.find(params[:user_id]).posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    respond_to do |format|
      format.html { render :new }
    end
  end
end
