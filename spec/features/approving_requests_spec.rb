feature 'approving signup' do
  scenario 'a user can approve a booking' do
    DatabaseCleaner.clean_with(:truncation)
    two_users_sign_up_and_login_and_book_a_space
    click_button 'Logout'
    visit('/login')
    fill_in 'username', with: 'Fran'
    fill_in 'password', with: 'password'
    click_link 'Booking Requests'
    expect(page).to have_content 'My house'
  end
end
