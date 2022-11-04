class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @comments = Post.find(params[:post_id]).comments
    respond_to do |format|
      
      format.xml  { render :xml => @comments }
      format.json { render :json => @comments }
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    flash[:success] = 'Comment added successfuly'

    if @comment.save
      respond_to do |format|
        format.html 
        format.xml  { render :xml => 'Comment added successfuly' }
        format.json { render :json =>  flash[:success].to_s }
      end
    else
      
      respond_to do |format|
        format.html { render :new }
        format.xml  { render :xml => 'Error!!!' }
        format.json { render :text => 'Error!!!' }
      end
    end
    
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to user_posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
