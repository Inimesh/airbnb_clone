# Helps test persisted data i.e. if the data just inserted is stored the same in the actual table
require 'pg'

def persisted_data(id)
  connection = DatabaseConnection.setup('makersbnb_test')
  result = connection.query("SELECT * FROM users WHERE user_id = #{id};")
  result.first
end
