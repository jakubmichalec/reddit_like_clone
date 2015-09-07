RSpec.feature 'Users can delete links' do
  let(:user) { create(:user) }
  let(:link) { create(:link, user: user) }

  before do
    visit link_path(link)
  end

  scenario 'successfully' do
    click_link 'Delete Link'

    expect(page).to have_content 'Link has been deleted'
    expect(page.current_url).to eq links_url
    expect(page).to have_no_content 'Awesome Link'
  end
end
