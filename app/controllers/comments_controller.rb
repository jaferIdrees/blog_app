class CommentsController < ApplicationController
  def new
    post_id = params[:id]
    comment = Comment.new
    respond_to do |format|
      format.html { render :new_comment, locals: { comment: comment, post_id: post_id } }
    end
  end

  def create
    # new object from params
    post = Post.find(params[:id])
    comment = Comment.new(text: params[:comment][:text], post: post, author: current_user)
    # respond_to block
    if comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_to "/users/:user_id/posts/#{post[:id]}"
    else
      flash.now[:error] = 'Error: Comment could not be saved'
      render inline: '<p>Error</p>'
    end
  end
end
