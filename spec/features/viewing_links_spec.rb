RSpec.feature 'Users can view links' do
  scenario 'with all details' do
    link = create(:link, title: "Awesome stuff", url: 'www.awesome.com')

    visit '/'
    click_link 'Awesome stuff'
    expect(page.current_url).to eq link_url(link)
  end
end
