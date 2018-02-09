feature 'User can see all their listed spaces' do
  scenario 'user can see only their space(s)' do
    signup
    fill_in_listing
    click_button 'Logout'
    signup(username: 'Bob', password: '123')
    fill_in_listing(name: 'Anything',
                    description: 'The best place!',
                    price: '10',
                    from_date: '16/03/2018',
                    to_date: '16/04/2018')
    click_button 'See all Bob\'s spaces'
    expect(page).to have_text('The best place!')
    expect(page).not_to have_text('My house')
  end
end
