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
    click_button 'Approve'
    expect(Space.first.booking).to eq('booked')
    expect(page).to have_content 'Booking approved'
    expect(page).not_to have_content 'My house'
  end

end

feature 'approving signup with multiple properties' do
  before do
    DatabaseCleaner.clean_with(:truncation)
    signup
    fill_in_listing
    click_button 'List my space'
    fill_in_listing(name: 'Anything',
                    description: 'The best place!',
                    price: '10',
                    from_date: '16/03/2018',
                    to_date: '16/04/2018')
    click_button 'List my space'
    click_button 'Logout'
    signup(username: 'John' , password: 'password')
    click_button('space1')
    click_button 'Logout'
    login
    click_link 'Booking Requests'
  end

  scenario 'approving a booking' do

    expect(page).to have_content 'My house'
    expect(page).not_to have_content 'Anything'
  end
end
