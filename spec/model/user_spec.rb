# require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) { User.create(name: 'user1', email: 'user1@myemail.com', password: 'password') }
  let(:user2) { User.create(name: 'user2', email: 'user2@myemail.com', password: 'password') }
  let(:invalid_user) { User.create(name: nil, email: 'user@email.com', password: 'password') }

  describe 'a user can be created' do
    it 'user is valid (name,email,pwd: present))' do
      expect(user1).to be_valid
    end

    it 'user is invalid (name:nil)' do
      expect(invalid_user).to_not be_valid
    end
  end

  describe 'friendship request can be created' do
    it 'user can add friend requests' do
      friendship = user1.friendships.new(friend_id: user2.id)
      friendship.save

      expect(user1.pending_friends.size).to eq(1)
    end

    it 'user accepts friend requests' do
      friendship = user1.friendships.new(friend_id: user2.id)
      friendship.save
      user2.confirm_friend(user1)
      friends = user1.friend?(user2)
      expect(friends).to eq(true)
    end

    it 'user rejects friend requests' do
      friendship = user1.friendships.new(friend_id: user2.id)
      friendship.save
      user2.reject_friend(user1)
      expect(user1.friend?(user2)).to be false
    end
    describe '2 rows for mutual friendship' do
      it 'creates a second row when invitation is confirmed' do
        Friendship.create(user_id: user2.id, friend_id: user1.id)
        user1.confirm_friend(user2)
        row = Friendship.where(user_id: user1.id, friend_id: user2.id, status: true)
        expect(row.empty?).not_to be true
      end
    end
  end
end
