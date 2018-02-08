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
end
