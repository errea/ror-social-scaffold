require 'rails_helper'

RSpec.describe 'Login a user', type: :feature do
  before(:each) do
    @user = User.create(name: 'eri', email: 'eri@.com', password: '123456')
  end
  scenario 'valid inputs' do
    visit user_session_path
    fill_in 'user[email]', with: 'eri@.com'
    fill_in 'user[password]', with: '123456'
    click_on 'Log in'
    visit root_path
    click_on 'Sign out'
    visit user_session_path
    expect(page).to have_content('Sign in')
  end
end
