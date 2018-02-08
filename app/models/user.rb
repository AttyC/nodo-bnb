class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :password, BCryptHash

  has n, :spaces

  def self.authenticate(username, password)
    auth_user = first(username: username)
    p "auth user???"
    p auth_user
    auth_user.password == password ? auth_user : nil
  end
end
