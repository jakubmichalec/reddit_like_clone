RSpec.feature 'Users can edit existing links' do
  let(:user) { create(:user) }
  let!(:link) { create(:link, user: user)}
  let(:other_user) { create(:user) }

  before do
    login_as(user)

    visit '/'
    click_link link.title
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

  scenario 'only if they logged in' do
    log_out(user)

    visit '/'
    click_link link.title
    click_link 'Edit Link'

    expect(page).to have_content "You must log in first"
  end

  scenario 'only if current user is link owner' do
    log_out(user)
    login_as(other_user)

    visit '/'
    click_link link.title
    click_link 'Edit Link'

    expect(page).to have_content "You can change only your own links"
  end
end
