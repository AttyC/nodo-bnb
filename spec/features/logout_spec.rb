feature 'logout' do
  scenario 'user logs out' do
    signup
    login
    click_button 'Logout'
    expect(page).to have_text('Thank you for visiting NodoBnB')
    expect(page).not_to have_text('Hello, Fran!')
  end
end
