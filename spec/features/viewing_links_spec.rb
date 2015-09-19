RSpec.feature 'Users can view links' do
  let(:user) { create(:user) }
  let!(:link) { create(:link, user: user)}

  scenario 'with all details' do
    visit '/'
    click_link link.title
    expect(page.current_url).to eq link_url(link)
  end
end
