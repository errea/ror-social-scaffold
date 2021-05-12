class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[ show edit update destroy ]

  # GET /friendships or /friendships.json
  def index
    @friendships = Friendship.all
  end

  # GET /friendships/1 or /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships or /friendships.json
  def create
    @user = User.find(params[:user_id])    
    @friendship = current_user.friendships.new(friend_id: params[:user_id])

    if @friendship.save
      redirect_to users_path,
      notice: "Woohoo!!! You invited a  #{@friendship.friend.name}!"
    else
      redirect_to users_path, alert: 'Friend Request Failed!'
    end

  end  
  # PATCH/PUT /friendships/1 or /friendships/1.json

  def update
    # friend = User.find_by(id: params[:user_id])
    friend = User.find(params[:user_id])
    current_user.confirm_friend(friend)
    redirect_to user_path, notice: "#{friend.name} is now your friend ! "
  end

  # DELETE /friendships/1 or /friendships/1.json
  def destroy
    friendship = Friendship.find(params[:id])
    friend = friendship.user
    current_user.reject_friend(friend)
    redirect_to user_path, notice: "Rejected #{friend.name}'s Friend Request!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :status)
    end
end
