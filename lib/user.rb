require_relative './database_connection'
require 'bcrypt'

class User
  attr_reader :user_id, :username, :email, :fullname, :pw

  def initialize(user_id:, username:, email:, fullname:, pw:)
    @user_id = user_id
    @username = username
    @email = email
    @fullname = fullname
    @pw = pw
  end

  def self.add_user(username:, email:, fullname:, pw:)
    encrypted_password = BCrypt::Password.create(pw)
    
    return unless User.unique?(username)

    rs = DatabaseConnection.query(
'INSERT INTO users(username, email, fullname, pw) VALUES ($1, $2, $3, $4) RETURNING user_id, username, email, fullname, pw;', [
  username, email, fullname, encrypted_password])

    User.new(user_id: rs[0]['user_id'], username: rs[0]['username'], email: rs[0]['email'], 
fullname: rs[0]['fullname'], pw: rs[0]['pw'])
  end

  def self.unique?(username)
    rs = DatabaseConnection.query("SELECT EXISTS(SELECT * FROM users WHERE username = $1)", 
[username])
    return true if rs[0]['exists'] == 'f'
  end
end
