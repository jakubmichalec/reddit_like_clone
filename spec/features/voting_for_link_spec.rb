RSpec.feature 'User can vote and unvote link' do
  let(:user) { create(:user) }
  let!(:link) { create(:link, user_id: user.id) }

  before do
    login_as(user)
    visit link_path(link)
  end

  scenario '#vote up' do
    find('#vote-up').click
    expect(link.up_votes).to eq 1
  end

  scenario '#vote down' do
    find('#vote-down').click
    expect(link.down_votes).to eq 1
  end
end
