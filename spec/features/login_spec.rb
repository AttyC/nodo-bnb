feature 'login' do
  scenario 'user logs in' do
    signup
    expect(page).to have_text('Hello, Fran!')
  end

  scenario 'user uses wrong password' do
    signup
    visit('/login')
    fill_in 'username', with: 'Fran'
    fill_in 'password', with: 'doggy'
    click_button 'login'
    expect(page).to have_text('Please enter the correct login details')
  end
end
