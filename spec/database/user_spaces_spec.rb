feature 'Add user and spaces' do
  scenario 'can add multiple spaces to user' do
    signup
    fill_in_listing
    space = Space.first
    expect(User.get(space.user_id).username).to eq('Fran')
  end
end
