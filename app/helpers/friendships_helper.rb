module FriendshipsHelper
  # Users who are yet to be confirmed as friends
  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.status }.compact
  end

  # Users who have requested to be friends
  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.status }.compact
  end

  # Method to confirm friend request
  def confirm_friend(user)
    friendship = inverse_friendships.find { |f| f.user == user }
    friendship.status = true
    friendship.save
  end

  # Method to check if a given user is a friend
  def friend?(user)
    friends.include?(user)
  end
end
