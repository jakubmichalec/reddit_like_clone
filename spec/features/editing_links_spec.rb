RSpec.feature 'Users can edit existing links' do
  let(:user) { create(:user) }
  let(:link) { create(:link, user: user)}

  before do
    visit link_path(link)
    #login_as(user)

    visit '/'
    click_link "Awesome stuff"
    click_link 'Edit Link'
  end

  scenario 'with valid attributes' do
    fill_in 'Title', with: "More Awesome stuff"
    click_button 'Update Link'

    expect(page).to have_content 'Link has been updated'
    expect(page).to have_content 'More Awesome stuff'
  end

  scenario 'with invalid attributes' do
    fill_in 'Title', with: " "
    click_button 'Update Link'

    expect(page).to have_content "Link has not been updated"
  end
end
