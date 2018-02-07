feature 'user sign up' do
  scenario 'user enter their name' do
    visit('/')
    fill_in 'user_name', with: 'Fran'
    fill_in 'password', with: 'Idunno'
    click_button 'Submit'
    expect(page).to have_text('Fran')
  end
end
