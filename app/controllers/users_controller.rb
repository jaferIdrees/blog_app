class UsersController < ApplicationController
  def index
    @users = User.all.order(id: :asc)
    @current = current_user if current_user

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @users }
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
