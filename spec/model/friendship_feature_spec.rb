require 'rails_helper'
# friendship feature
RSpec.feature 'Friendship invitation', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'eri', email: 'eri@.com', password: '123456')
    @user2 = User.create(name: 'jay', email: 'jay@.com', password: '123456')
  end
  scenario 'send friend request' do
    visit 'users/sign_in'
    fill_in 'user[email]', with: 'eri@.com'
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    visit 'users'
    click_link 'Add Friend'
    expect(page).to have_text('Friend request sent!')
  end
end
RSpec.feature 'Cancel friend request', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'eri', email: 'eri@.com', password: '123456')
    @user2 = User.create(name: 'jay', email: 'jay@.com', password: '123456')
  end
  scenario 'Cancel pending friend request' do
    visit 'users/sign_in'
    fill_in 'user[email]', with: 'eri@.com'
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    visit 'users'
    click_link 'Add Friend'
    click_link 'Cancel Request'
    visit 'users'
  end
end
RSpec.feature 'Accept request', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'eri', email: 'eri@.com', password: '123456')
    @user2 = User.create(name: 'jay', email: 'jay@.com', password: '123456')
  end
  scenario 'Accept a friend request' do
    visit 'users/sign_in'
    fill_in 'user[email]', with: 'eri@.com'
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    visit 'users'
    click_link 'Add Friend'
    click_on 'Sign out'
    visit new_user_session_path
    fill_in 'user[email]', with: 'jay@.com'
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    visit 'users'
    expect(page).to have_text('Confirm')
    click_link 'Confirm'
    visit 'users'
  end
end
RSpec.feature 'Cancel friend request', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'eri', email: 'eri@.com', password: '123456')
    @user2 = User.create(name: 'jay', email: 'jay@.com', password: '123456')
  end
  scenario 'Reject an invitation' do
    visit 'users/sign_in'
    fill_in 'user[email]', with: 'eri@.com'
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    visit 'users'
    click_link 'Add Friend'
    click_on 'Sign out'
    visit new_user_session_path
    fill_in 'user[email]', with: 'jay@.com'
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    visit 'users'
    expect(page).to have_text('Reject')
    click_link 'Reject'
    visit 'users'
  end
end
