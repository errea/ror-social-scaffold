class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
      format.json { render :json => @users }
    end
    @friendship = current_user.friendships.build
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    @friendship = current_user.friendships.build
  end

  def update
    @user = User.find(params[:user_id])
    if current_user.confirm_friend(@user)
      redirect_to users_path, notice: 'Your friend was accepted ! '
    else
      redirect_to users_path, alert: 'Friend request failed !'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    if current_user.reject_friend(@user)
      redirect_to users_path, notice: 'Your friend was rejected ! '
    else
      redirect_to users_path, alert: 'Your request is pending ! '
    end
  end
end
