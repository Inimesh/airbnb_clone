require_relative './user'
require 'singleton'


class SignUpValidator
  include Singleton

  def self.password_valid?(pwd1, pwd2)
    return true if pwd1 == pwd2
    return false
  end

  # def self.validate(username, email)
  #   username_valid?(username) && email_valid?(email)
  # end

  # private

  # def self.username_valid?(username)
  #   find_user method to be implemented in User class
  #   !!User.find_user('username', username) ? false : true
  # end

  # def self.email_valid?(email)
  #   # find_user method to be implemented in User class
  #   !!User.find_user('email', email) ? false : true
  # end
end
