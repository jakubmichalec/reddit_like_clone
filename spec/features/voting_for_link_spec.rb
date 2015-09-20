RSpec.feature 'User can vote and unvote link' do
  let(:user) { create(:user) }
  let(:link) { create(:link, user_id: user.id) }

  before do
    login_as(user)
    visit link_path(link)
  end

  scenario '#vote up' do
    click_link "Vote Up"
    expect(link.up_votes).to eq 1
  end

  scenario '#vote down' do
    click_link 'Vote Down'
    expect(link.down_votes).to eq 1
  end
end
