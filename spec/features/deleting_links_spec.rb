RSpec.feature 'Users can delete links' do
  let!(:user) { create(:user) }
  let!(:link) { create(:link, user_id: user.id) }
  let(:other_user) { create(:user) }

  scenario 'successfully' do
    login_as(user)
    visit link_path(link)
    click_link 'Delete Link'

    expect(page).to have_content 'Link has been deleted'
    expect(page.current_url).to eq links_url
    expect(page).to have_no_content link.title
  end


  scenario 'only if they logged in' do
    visit link_path(link)

    expect(page).to_not have_content 'Delete Link'
  end

  scenario 'only if current user is link owner' do
    login_as(other_user)
    visit link_path(link)
    click_link 'Delete Link'

    expect(page).to have_content 'You can change only your own links'
  end
end
