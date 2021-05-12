require 'rails_helper'

RSpec.describe 'friendships/index', type: :view do
  before(:each) do
    assign(:friendships, [
             Friendship.create!(
               user: nil,
               friend: nil,
               status: false
             ),
             Friendship.create!(
               user: nil,
               friend: nil,
               status: false
             )
           ])
  end

  it 'renders a list of friendships' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
  end
end
