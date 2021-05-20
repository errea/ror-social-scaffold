# rubocop:disable Lint/UselessAssignment
# rubocop:disable Layout/LineLength

module UsersHelper
  def button_display(user)
    if current_user.friend?(user)
      val = link_to 'Remove Friend', friendship_path(id: current_user.id, user_id: user.id), method: :delete, class: 'user-button'
      val += '  You are Friends'

    elsif current_user.pending_friends.include?(user)
      val = link_to 'Cancel Request', cancel_path(user_id: user.id), method: :post, class: 'user-button'
      val += ''
      
    elsif current_user.friend_requests.include?(user)
      val = link_to 'Confirm', accept_path(user_id: user.id), method: :post, class: 'user-button'
      val += link_to 'Reject', reject_path(user_id: user.id), method: :post, class: 'user-button'  
    
    elsif current_user == user
      '‏‏‎ ‎‏‏‎ ‎This is you'
    
    elsif !current_user.friend?(user) && current_user != user
      link_to('Add Friend', friendships_path(user_id: user.id), method: :post, class: 'user-button')
    end
    # res = ''
    # return if current_user.id == user.id 
    # return if current_user.friend?(user)
    # if current_user.pending_friends.include?(user)
    # res << link_to('pending', '#') 
    # elsif current_user.friend_requests.include?(user)
    # res << link_to('Accept', users_path(user_id: user.id), method: :put) 
    # res << ' | '      
    # res << link_to('Reject', reject_path(user_id: user.id), method: :delete)    
    # else 
    #  res << link_to('Add Friend', friendships_path(user_id: user.id), method: :post)    
    # end
    # res.html_safe
  end  
end
# rubocop:enable Lint/UselessAssignment
# rubocop:enable Layout/LineLength
