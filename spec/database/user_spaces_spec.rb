feature 'Add user and spaces' do
  scenario 'can add multiple spaces to user' do
    visit('/')
    fill_in 'username', with: 'Fran'
    fill_in 'password', with: 'Idunno'
    click_button 'Submit'
    fill_in_listing
    click_button('List my space')
    space = Space.first
    expect(User.get(space.user_id).username).to eq('Fran')
  end
end
