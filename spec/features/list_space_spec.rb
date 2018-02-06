feature 'list space' do
  scenario 'user lists a new space' do
    visit('/spaces/new')
    fill_in 'name', with: 'Fran'
    fill_in 'description', with: 'Nice place!'
    fill_in 'price', with: '100'
    fill_in 'from_date', with: '12/10/2018'
    fill_in 'to_date', with: '19/10/2018'
    click_button 'List my space'
    expect(page).to have_text('Your space is listed')
  end
end
