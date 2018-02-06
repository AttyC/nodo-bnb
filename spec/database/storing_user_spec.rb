describe 'add one user to databse' do
  it 'adds a single user to the database' do
    expect { User.create(username: 'Fran')}.to change(User, :count).by 1
  end
end
