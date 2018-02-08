feature 'logout' do
  scenario 'user logs out' do
    password = 'password'
    sign_up_and_login(password)
    click_button 'Logout'
    expect(page).to have_text('Byeee!')
    expect(page).not_to have_text('Hello, Fran!')
  end
end
