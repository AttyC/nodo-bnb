describe 'add one user to databse' do
  it 'adds a single user to the database' do
    expect { User.create(username: 'Fran')}.to change(User, :count).by 1
  end

  it 'stores an encrypted password for user' do
    person = User.create(username: 'Fran', password: 'password')
    expect(person.password.to_s).not_to eq('password')
  end
end
