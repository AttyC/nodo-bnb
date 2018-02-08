def fill_in_listing(name: 'My house',
                    description: 'Nice place!',
                    price: '100',
                    from_date: '12/10/2018',
                    to_date: '19/10/2018')

  visit('/spaces/new')
  fill_in :name, with: name
  fill_in :description, with: description
  fill_in :price, with: price
  fill_in :from_date, with: from_date
  fill_in :to_date, with: to_date
end

def sign_up_and_login(password = 'password')
  User.create(username: 'Fran', password: 'password')
  visit('/login')
  fill_in 'username', with: 'Fran'
  fill_in 'password', with: password
  click_button 'login'
end
