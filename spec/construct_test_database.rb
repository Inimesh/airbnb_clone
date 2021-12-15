# def construct_test_database
#   require 'pg'
  
#   p "Setting up test database..."
  
#   #Connect to test database & create bookmarks table
#   db_connect = PG.connect(dbname: 'bookmark_manager_test')
#   #Create bookmarks table
#   db_connect.exec("CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));")
#   #Create comments table
#   db_connect.exec("CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), bookmark_id INTEGER REFERENCES bookmarks (id) ON DELETE CASCADE ON UPDATE CASCADE);")
#   #Populate bookmarks table
#   db_connect.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'makers');")
#   db_connect.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'destroyallsoftware');")
#   db_connect.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'google');") 
#   #Populate Comments table
#   db_connect.exec("INSERT INTO comments (text, bookmark_id) VALUES ('great for learning quickly', '1');")
#   db_connect.exec("INSERT INTO comments (text, bookmark_id) VALUES('very entertaining', '2');")
#   db_connect.exec("INSERT INTO comments (text, bookmark_id) VALUES('informative and conveninent', '3');") 
#   # db_connect.exec("INSERT INTO comments (text, bookmark_id) VALUES('intense study', '1');") 
# end
