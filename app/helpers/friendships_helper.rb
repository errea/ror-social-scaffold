module FriendshipsHelper
  # Users who are yet to be confirmed as friends
  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.status }.compact
  end

  # Users who have requested to be friends
  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.status }.compact
  end
<<<<<<< HEAD
=======

>>>>>>> e7e1174448b2e92dae2e1fcaddce02644e4c027c
end
