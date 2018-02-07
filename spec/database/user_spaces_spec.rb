feature 'Add user and spaces' do
  scenario 'can add multiple spaces to user' do
    visit('/')
    fill_in 'user_name', with: 'Fran'
    fill_in 'password', with: 'Idunno'
    click_button 'Submit'
    fill_in_listing
    click_button('List my space')
    user = User.first
    p Space.all
    expect(Space.get(0)).to eq('Fran')
  end
end
