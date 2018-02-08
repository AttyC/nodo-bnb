feature 'login' do
  scenario 'user logs in' do
    password = 'password'
    sign_up_and_login(password)
    expect(page).to have_text('Hello, Fran!')
  end

  scenario 'user uses wrong password' do
    password = 'doggy'
    sign_up_and_login(password)
    expect(page).to have_text('Please enter the correct login details')
  end
end
