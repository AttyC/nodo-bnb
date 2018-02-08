feature 'Saving booking' do
  scenario 'User can book a space' do
    two_users_sign_up_and_login_and_book_a_space
    expect(page).to have_selector("input[type=submit][value='Book']")
  end

  scenario 'Space has status pending' do
    two_users_sign_up_and_login_and_book_a_space
    click_button 'Book'
    expect(Space.first.booking).to eq('pending')
  end

  scenario 'book one of multiple spaces' do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    sign_up_and_login('password')
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
