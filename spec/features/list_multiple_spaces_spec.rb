feature 'Listing multiple spaces' do
  scenario 'A user can list multiple spaces' do
    signup
    fill_in_listing
    fill_in_with_st_pauls
    expect(page).to have_text('Fran')
    expect(page).to have_text('Nice place!')
    expect(page).to have_text('100')
    expect(page).to have_text('12-10-2018')
    expect(page).to have_text('19-10-2018')
    expect(page).to have_text('St Pauls')
    expect(page).to have_text('The best place!')
    expect(page).to have_text('10')
    expect(page).to have_text('16-03-2018')
    expect(page).to have_text('16-04-2018')
  end
end
