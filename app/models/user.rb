require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/nodo_#{ENV['RACK_ENV']}")
