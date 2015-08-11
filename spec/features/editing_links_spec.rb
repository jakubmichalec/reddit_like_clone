RSpec.feature 'Users can edit existing links' do
  before do
    create(:link, title: "Awesome stuff", url: 'www.awesome.com')

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
