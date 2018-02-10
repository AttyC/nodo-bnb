feature 'login' do
  scenario 'user logs in' do
    signup
    expect(page).to have_text('Hello, Fran')
  end

  scenario 'user uses wrong password' do
    signup
    logout
    click_button 'Log In'
    fill_in 'username', with: 'Fran'
    fill_in 'password', with: 'doggy'
    click_button 'Log In'
    expect(page).to have_text('Log in:')
  end
end
