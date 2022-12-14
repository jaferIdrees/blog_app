class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @posts = User.find(params[:user_id]).posts
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @posts }
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.author_id)
    @like = Like.new
    @comments = Comment.where(post_id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # new object from params
    post = Post.new(title: params[:post][:title], text: params[:post][:text], author: current_user)
    # respond_to block
    if post.save

      respond_to do |format|
        format.html do
          flash[:success] = 'Post saved successfully'
          redirect_to "/users/#{current_user.id}/posts"
        end
        format.xml { render xml: flash[:success] }
        format.json { render json: flash[:success] }
      end
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render inline: '<p>Error: Post could not be saved<p>'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to user_posts_path
  end

  def like
    post = Post.find(params[:id])
    Like.create(post: post, author: current_user)
    redirect_to "/users/:user_id/posts/#{post[:id]}"
  end
end
