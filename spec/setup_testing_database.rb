# frozen_string_literal: true

require 'pg'
require_relative './../lib/database_connection'

def truncate
  p 'Connecting to makersbnb_test database...'
  DatabaseConnection.setup('makersbnb_test')
  p 'Cleaning up tables...'
  DatabaseConnection.query('TRUNCATE users RESTART IDENTITY CASCADE ')
  # DatabaseConnection.query('TRUNCATE users')
end
