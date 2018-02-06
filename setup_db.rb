require 'pg'

puts 'Setting up databases...'
conn = PG.connect(dbname: 'postgres')

conn.exec('CREATE database nodo_development')
puts 'Development database setup'

conn.exec('CREATE database nodo_test')
puts 'Test database setup'
