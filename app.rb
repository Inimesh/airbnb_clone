require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './database_connection_setup'


class MakersBnb < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  # routes:
  get '/' do
    erb(:index)
  end

  get '/sign-up' do
    erb(:sign_up)
  end

  post '/sign-up' do
    session['sign_up_data'] = params
    flash[:welcome] = "Welcome #{params['name']}"
    redirect '/'
    # TODO create model to check if username and email are unique
    # TODO test to make sure the two passwords match
    # TODO have session['logged_in_user'] = User.instance
    # TODO Rubygem encrypt password when entered and then save in database as encrypted
  end
  

  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end