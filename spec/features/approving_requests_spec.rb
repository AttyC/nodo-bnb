feature 'approve single booking' do
  before do
    DatabaseCleaner.clean_with(:truncation)
    signup
    fill_in_listing
    logout
    signup(username: 'bob', password: 'Bobrules')
    click_button 'Book'
    logout
    login
    click_link 'Booking Requests'
  end

  scenario 'a lister can see a booking request has been made' do
    expect(page).to have_content 'My house'
    expect(page).to have_content 'bob'
  end

  scenario 'a lister can approve a booking' do
    click_button 'Approve'
    expect(Space.first.booking).to eq('booked')
    expect(page).to have_content 'Booking approved'
    expect(page).not_to have_content 'My house'
  end
end

feature 'filters out unrequested bookings' do
  before do
    DatabaseCleaner.clean_with(:truncation)
    signup
    fill_in_listing
    fill_in_with_st_pauls
    logout
    signup(username: 'John', password: 'password')
    fill_in_with_makers
    click_button('space2')
    logout
  end

  scenario 'approving a booking' do
    login
    click_link 'Booking Requests'
    click_button 'Approve'
    expect(Space.get(2).booking).to eq('booked')
    expect(Space.get(1).booking).to eq 'available'
    expect(page).to have_content 'Booking approved'
    expect(page).not_to have_content 'My house'
    expect(page).not_to have_content 'Anything'
  end

  scenario 'another user signs in' do
    signup(username: 'EdW', password: 'Confused')
    click_button('space3')
    logout
    login
    click_link 'Booking Requests'
    expect(page).not_to have_content 'Makers'
    expect(page).to have_content 'St Pauls'
  end
end

feature 'Shoppers have their bookings confirmed' do
  scenario 'User sees their booking was confirmed' do
    DatabaseCleaner.clean_with(:truncation)
    signup
    fill_in_listing
    fill_in_with_makers
    click_button 'Logout'
    signup(username: 'dom', password: 'tom')
    click_button 'space1'
    click_button 'space2'
    click_button 'Logout'
    login
    click_link 'Booking Requests'
    click_button 'booking2'
    logout
    login(username: 'dom', password: 'tom')
    click_link 'Booking Requests'

    within '#requests' do
      within '#request1' do
        expect(page).to have_content 'My house'
        expect(page).to have_content 'pending'
      end

      within '#request2' do
        expect(page).to have_content 'Makers Academy'
        expect(page).to have_content 'booked'
      end
    end
  end
end
