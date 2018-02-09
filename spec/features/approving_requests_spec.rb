feature 'approving signup' do
  before do
    DatabaseCleaner.clean_with(:truncation)
    two_users_sign_up_and_login_and_book_a_space
    click_button 'Book'
    click_button 'Logout'
    visit('/login')
    fill_in 'username', with: 'Fran'
    fill_in 'password', with: 'password'
    click_link 'Booking Requests'
  end

  scenario 'a user can approve a booking' do
    expect(page).to have_content 'My house'
  end

  scenario 'approving a booking' do
    p Space.all
    click_button 'Approve'
    expect(Space.first.booking).to eq('booked')
    expect(page).to have_content 'Booking approved'
    expect(page).not_to have_content 'My house'
  end

end
