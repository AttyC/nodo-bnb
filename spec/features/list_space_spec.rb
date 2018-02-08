feature 'list space' do
  scenario 'user lists a new space' do
    fill_in_listing
    click_button 'List my space'
    expect(page).to have_text('Your space is listed')
  end
end

feature 'Store space in database' do
  scenario 'user creates a new space' do
    fill_in_listing
    expect { click_button('List my space') }.to change(Space, :count).by 1
  end
end

feature 'View new space' do
  scenario 'user an view a new space' do
    fill_in_listing
    click_button 'List my space'
    expect(page).to have_text('Fran')
    expect(page).to have_text('Nice place!')
    expect(page).to have_text('100')
  end

  scenario 'see\'s first date avaliable' do
     fill_in_listing
     click_button 'List my space'
     expect(page).to have_text('12-10-2018')
  end
end
