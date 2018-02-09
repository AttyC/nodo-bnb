feature 'User can see all their listed spaces' do
  scenario 'user can see only their space(s)' do
    two_users_sign_up_and_login_and_book_a_space
    fill_in_listing(name: 'Anything',
                    description: 'The best place!',
                    price: '10',
                    from_date: '16/03/2018',
                    to_date: '16/04/2018')
    click_button 'List my space'
    click_button 'See all Bob\'s spaces'
    expect(page).to have_text('The best place!')
    expect(page).not_to have_text('My house')
  end
end
