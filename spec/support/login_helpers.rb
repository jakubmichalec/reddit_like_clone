module LoginHelpers
  def login_as(user)
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
  end

  def log_out(user)
    visit '/'
    click_link 'Sign Out'
  end
end

RSpec.configure do |c|
  c.include LoginHelpers, type: :feature
end
