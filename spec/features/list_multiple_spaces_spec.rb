feature 'Listing multiple spaces' do
  scenario 'A user can list multiple spaces' do
    fill_in_listing
    click_button 'List my space'
    fill_in_listing(name: 'Fran',
                    description: 'The best place!',
                    price: '10',
                    from_date: '16/03/2018',
                    to_date: '16/04/2018')
    click_button 'List my space'
    expect(page).to have_text('Nice place!')
    expect(page).to have_text('2018-10-12')
    expect(page).to have_text('The best place!')
    expect(page).to have_text('2018-03-16')
  end
end
