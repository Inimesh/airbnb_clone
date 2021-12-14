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
    if SignUp.password_valid?(params['password'], params['password_confirm'])
      if SignUp.validate(params['username'], params['email'])
        # User.add_user(params)
        flash[:welcome] = "Welcome #{params['name']}"
        redirect '/'
      else
        flash[:details_in_use] = "Username or email already registered"
      end
    else
      flash[:password_error] = "Wrong password"
      redirect '/sign-up'
    end
    # TODO create model to check if username and email are unique (commented out in sign_up.rb - requires database)
    # TODO have session['logged_in_user'] = User.instance
  end
  

  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end