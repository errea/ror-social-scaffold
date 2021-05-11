require 'rails_helper'

RSpec.describe "friendships/show", type: :view do
  before(:each) do
    @friendship = assign(:friendship, Friendship.create!(
      user: nil,
      friend: nil,
      status: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
