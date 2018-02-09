feature 'log in to list space' do
  scenario 'user has to log in to list a new space' do
    fill_in_listing
    expect(page).to have_text('Please log in to list a space')
  end
end

feature 'list space' do
  before do
    signup
    fill_in_listing
  end

  scenario 'user lists a new space' do
    expect(page).to have_text('Your space is listed')
  end

  scenario 'listing displays the user that listed it' do
    within '#listings' do
      expect(page).to have_text('Fran')
    end
  end
end

feature 'Store space in database' do
  scenario 'user creates a new space' do
    signup
    expect { fill_in_listing }.to change(Space, :count).by 1
  end
end

feature 'View new spaces' do
  scenario 'user can view a new space' do
    signup
    fill_in_listing
    fill_in_with_st_pauls
    expect(page).to have_text('Fran')
    expect(page).to have_text('Nice place!')
    expect(page).to have_text('100')
    expect(page).to have_text('St Pauls')
    expect(page).to have_text('The best place!')
    expect(page).to have_text('10')
    expect(page).to have_text('12-10-2018')
    expect(page).to have_text('19-10-2018')
    expect(page).to have_text('16-03-2018')
    expect(page).to have_text('16-04-2018')
    expect(page).to have_text('7 days')
  end
end
