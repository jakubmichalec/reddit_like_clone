RSpec.feature 'User can add comment to link' do
  let(:user) { create(:user) }
  let!(:link) { create(:link, user: user) }

  before do
    login_as(user)
  end

  scenario 'with valid attributes' do
    visit link_path(link)
    click_link 'Add Comment'
    find('#comment_body').set("Some kind of test comment")
    click_button 'Add'

    expect(page).to have_content "Author: #{user.name}"
    expect(page).to have_content "Some kind of test comment"
  end
end
