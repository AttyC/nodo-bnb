feature 'Saving booking' do

  scenario 'Space has status pending' do
    signup
    login
    fill_in_listing
    click_button 'List my space'
    click_button 'Log Out'
    signup(username: 'bob', password: 'Bobrules')
    click_button 'Book'
    expect(Space.first.booking).to eq('pending')
  end

  scenario 'book one of multiple spaces' do
    DatabaseCleaner.clean_with(:truncation)
    signup
    login
    fill_in_listing
    click_button 'List my space'
    fill_in_listing(name: 'Anything',
                    description: 'The best place!',
                    price: '10',
                    from_date: '16/03/2018',
                    to_date: '16/04/2018')
    click_button 'List my space'
    click_button('space2')
    expect(Space.first.booking).to eq('available')
    expect(Space.last.booking).to eq('pending')
    expect(page).to have_text('Successfully requested booking')
  end
end
