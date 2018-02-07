require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :price, Float
  property :from_date, Date
  property :to_date, Date
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/nodo_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
