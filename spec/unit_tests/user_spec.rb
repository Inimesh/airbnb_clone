require 'user'
require_relative './../database_helper'
require 'bcrypt'

describe User do
  context '#add_user'
  it 'can create a new user' do
    user = User.add_user(username: 'test', email: 'test@makers.co.uk', fullname: 'test user', pw: 'abc123')

    persisted_data = persisted_data(user.user_id)

    p user

    expect(user).to be_a User
    expect(user.user_id).to eq persisted_data['user_id']
    expect(user.username).to eq 'test'
    expect(user.email).to eq 'test@makers.co.uk'
    expect(user.fullname).to eq 'test user'
    expect(user.pw).to eq BCrypt::Password.new(user.pw)
  end
end 