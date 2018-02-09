feature 'user sign up' do
  scenario 'user enter their name' do
    signup
    expect(page).to have_text('Fran')
  end
end

feature 'store user in database' do
  scenario 'enter password' do
    expect { signup }.to change(User, :count).by 1
  end
end
