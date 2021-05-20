class FriendshipsController < ApplicationController
  def create
<<<<<<< HEAD
    @friendship = current_user.friendships.build(friend_id: params[:user_id])
    @friendship.status = false
    if @friendship.save
=======
    @friendship = current_user.friendships.build(friend_id: params[:user_id]) 
      @friendship.status = false
    @friendship.save
>>>>>>> f67a7c2b003c279c144847d6fc13d6cba22099c0
      redirect_to users_path, notice: 'Friend request sent!'
  end

  def accept
    current_user.confirm_friend(User.find_by(id: params[:user_id]))
    redirect_to users_path
  end

<<<<<<< HEAD
=======

>>>>>>> f67a7c2b003c279c144847d6fc13d6cba22099c0
  def reject
    current_user.reject_friend(User.find_by(id: params[:user_id]))
    redirect_to users_path
  end

  def cancel
    current_user.cancel_request(User.find_by(id: params[:user_id]))
    redirect_to users_path
  end

  def destroy
    f1 = Friendship.all.find_by(user_id: params[:user_id], friend_id: current_user.id)
    f2 = Friendship.all.find_by(user_id: current_user.id, friend_id: params[:user_id])
    f1&.destroy
    f2&.destroy
    redirect_to users_path
  end
<<<<<<< HEAD

  def send_request(user)
    friendship = inverse_friendships.find_by(user_id: user.id)
    friendship.send = true
    friendship.destroy
  end
=======
  
>>>>>>> f67a7c2b003c279c144847d6fc13d6cba22099c0
end
