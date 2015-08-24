feature 'Users Authentication' do
  let!(:user) { create(:user) }

  scenario 'User can register' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Name', with: 'Sample Name'
    fill_in 'Email', with: 'example@example.com'
    fill_in('Password', with: 'password', match: :first)
    fill_in 'Password confirmation', with: 'password'
    click_button 'Create User'
    expect(page).to have_content 'Thank you for signing up'
  end

  scenario 'User can login with valid attributes' do
    login_as(user)

    expect(page).to have_content 'Signed in successfully'
    expect(page).to have_content "Signed in as #{user.email}"
  end

  scenario 'Signed in users, can sign out' do
    login_as(user)
    visit '/'
    click_link 'Sign Out'
    expect(page).to have_content 'Signed out successfully'
    expect(page).not_to have_content "Signed in as #{user.email}"
  end
end
