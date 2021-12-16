require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './database_connection_setup'
require_relative './lib/spaces'
require_relative './lib/sign_up_validator'
require_relative './lib/user'

class MakersBnb < Sinatra::Base
  enable :sessions

  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  # routes:
  get '/' do
    @current_user = session[:user_id]
    erb(:index)
  end

  get '/main_view' do
    @spaces = Spaces.all
    erb(:main_view)
  end

  get '/add_space' do
    erb(:add_space)
  end

  get '/confirm_add' do
    erb(:confirm_add)
  end

  post '/new_space' do
    @user_id = session[:user_id]
    Spaces.add_space(params[:space_name], params[:space_description], params[:price_per_night], @user_id)
    Spaces.add_availability(params[:space_id], params[:stay_start], params[:stay_finish])
    redirect '/main_view'
  end

  get '/sign-up' do
    erb(:sign_up)
  end

  post '/sign-up-details' do
    # session['sign_up_data'] = params
    if SignUpValidator.password_valid?(params['password'], params['password_confirm'])
      # if SignUp.validate(params['username'], params['email'])
      user = User.add_user(username: params[:username], email: params[:email], 
fullname: params[:fullname], pw: params[:password])
      
      session[:user_id], session[:username] = user.user_id, user.username
      p session[:user_id], session[:username]
      
      flash[:welcome] = "Welcome #{params[:username]}"
      redirect '/main_view'
    # else
    #     flash[:details_in_use] = "Username or email already registered"
    else
      flash[:password_error] = "Passwords don't match!"
      redirect '/main_view'
    end
    # TODO create model to check if username and email are unique (commented out in sign_up.rb - requires database)
    # TODO have session['logged_in_user'] = User.instance
  end
  

  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end
