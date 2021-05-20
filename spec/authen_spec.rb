# require 'capybara/rspec'

RSpec.describe 'Sign in', type: :system do
  before :each do
    User.create(name: 'Rock', email: 'rock@star.com', password: 'tomtomtown')
  end

  it 'signs me in' do
    visit '/users/sign_in'
    sleep(5)

    within('#new_user') do
      fill_in 'Email', with: 'rock@star.com'
      fill_in 'Password', with: 'tomtomtown'
    end

    sleep(5)
    click_button 'Log in'

    sleep(5)
    expect(page).to have_content 'Signed in successfully'
  end
end
