feature 'Saving booking' do
  before do
    DatabaseCleaner.clean_with(:truncation)
    signup
    fill_in_listing
  end

  scenario 'Space has status pending' do
    click_button 'Logout'
    signup(username: 'bob', password: 'Bobrules')
    click_button 'Book'
    expect(Space.first.booking).to eq('pending')
  end

  scenario 'book one of multiple spaces' do
    fill_in_with_st_pauls
    click_button('space2')
    expect(Space.first.booking).to eq('available')
    expect(Space.last.booking).to eq('pending')
    expect(page).to have_text('Successfully requested booking')
  end
end
