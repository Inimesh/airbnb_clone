def deconstruct_test_database
  require 'pg'
  
  p "Deleting test database..."
  
  # Connect to test database 
  db_connect = PG.connect(dbname: 'makersbnb_test')
  
  # clear all table rows
  db_connect.exec("TRUNCATE TABLE users, request, spaces, availability RESTART IDENTITY;");
#   # Delete requests table
#   db_connect.exec("DROP TABLE requests;")  
#   # Delete users table
#   db_connect.exec("DROP TABLE users;")  
#   # Delete comments spaces
#   db_connect.exec("DROP TABLE spaces;")  
#   # Delete availability table
#   db_connect.exec("DROP TABLE availability;")  

end
