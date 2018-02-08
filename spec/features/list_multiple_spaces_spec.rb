feature 'Listing multiple spaces' do
  scenario 'A user can list multiple spaces' do
    fill_in_listing
    click_button 'List my space'
    fill_in_listing(name: 'Anything',
                    description: 'The best place!',
                    price: '10',
                    from_date: '16/03/2018',
                    to_date: '16/04/2018')
    click_button 'List my space'
    expect(page).to have_text('Fran')
    expect(page).to have_text('Nice place!')
    expect(page).to have_text('100')
    expect(page).to have_text('12-10-2018')
    expect(page).to have_text('Anything')
    expect(page).to have_text('The best place!')
    expect(page).to have_text('10')
    expect(page).to have_text('16-03-2018')
  end
end
