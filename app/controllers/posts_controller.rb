class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = User.find(params[:user_id]).posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new_post, locals: { post: post } }
    end
  end

  def create
    # new object from params
    post = Post.new(title: params[:post][:title], text: params[:post][:text], author: current_user)
    # respond_to block
    if post.save
      flash[:success] = 'Post saved successfully'
      redirect_to "/users/#{current_user.id}/posts"
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render inline: '<p>Error: Post could not be saved<p>'
    end
  end
end
