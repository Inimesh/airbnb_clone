require './lib/database_connection.rb'

  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('makersbnb_test')
  else
    DatabaseConnection.setup('makersbnb')
  end

