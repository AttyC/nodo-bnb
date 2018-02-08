class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :password, BCryptHash

  def self.authenticate(username, password)
    auth_user = first(username: username)
    auth_user.password == password ? auth_user : nil
  end

end
