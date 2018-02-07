feature 'login' do
  scenario 'user logs in' do
    User.create(username: 'Fran', password: 'password')
    visit('/login')
    fill_in 'user_name', with: 'Fran'
    fill_in 'password', with: 'password'
    click_button 'login'
    expect(page).to have_text('Hello Fran!')
  end
end
