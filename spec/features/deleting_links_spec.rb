RSpec.feature 'Users can delete links' do
  scenario 'successfully' do
    create(:link, title: 'Awesome Link', url: 'www.example.com')

    visit '/'
    click_link 'Awesome Link'
    click_link 'Delete Link'

    expect(page).to have_content 'Link has been deleted'
    expect(page.current_url).to eq links_url
    expect(page).to have_no_content 'Awesome Link'
  end
end
