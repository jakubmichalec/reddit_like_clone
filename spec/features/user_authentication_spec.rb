feature 'Users' do

  scenario 'User can register' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Name', with: 'Sample Name'
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Create User'
    expect(page).to have_content 'Thank you for signing up'
  end
end
