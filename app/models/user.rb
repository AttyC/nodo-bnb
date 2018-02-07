class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :password, BCryptHash

  def self.authenticate(user_name, password)
    first(username: user_name)
  end

end
