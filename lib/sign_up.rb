require_relative './user'

class SignUp 
  def self.password_valid?(pwd1, pwd2)
    pwd1 == pwd2
  end
#   def self.validate(username, email)
#     username_valid?(username) && email_valid?(email)
#   end

#   private

#   def self.username_valid?(username)
#     # find_user method to be implemented in User class
#     !!User.find_user('username', username) ? false : true
#   end

#   def self.email_valid?(email)
#     # find_user method to be implemented in User class
#     !!User.find_user('email', email) ? false : true
#   end
end
