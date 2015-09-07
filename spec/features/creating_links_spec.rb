RSpec.feature 'Users can create new links' do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  scenario "with valid attributes" do
    visit '/'

    click_link 'New Link'

    fill_in 'Title', with: "Awesome stuff you need to see it"
    fill_in 'Url', with: 'www.google.com'
    click_button 'Create Link'

    expect(page).to have_content 'Link has been created'
  end
end
