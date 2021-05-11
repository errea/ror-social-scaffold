module FriendshipsHelper
  # Users who are yet to be confirmed as friends
  def pending_friends
    friendships.map{|friendship| friendship.friend if !friendship.status}.compact
  end

  # Users who have requested to be friends
  def friend_requests
    inverse_friendships.map{|friendship| friendship.user if !friendship.status}.compact
  end
end