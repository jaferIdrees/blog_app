class UsersController < ApplicationController
  def index
    if current_user
      @users = User.all.order(id: :asc)
      @current = current_user
    else
      @users = User.all.order(id: :asc)
      # redirect_to new_user_session_path, notice: 'You are not logged in.'
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
      format.json { render :json => @users }
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
