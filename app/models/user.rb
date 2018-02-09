class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :password, BCryptHash

  has n, :spaces

  def self.authenticate(username, password)
    auth_user = first(username: username)
    return nil if auth_user.nil?
    auth_user.password == password ? auth_user : nil
  end
end
