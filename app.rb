require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './database_connection_setup'
require_relative './lib/spaces'
require_relative './lib/sign_up_validator'
require_relative './lib/user'
require_relative './lib/request'

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
    @current_user = session[:user_id]
    erb(:main_view)
  end

  get '/add_space' do
    @current_user = session[:user_id]
    erb(:add_space)
  end 

  post '/add_space' do
    @user_id = session[:user_id]
    @space_id = Spaces.add_space(params[:space_name], params[:space_description], params[:price_per_night], @user_id)
    Spaces.add_availability(@space_id, params[:stay_start], params[:stay_finish])
    redirect '/main_view'
  end

  get '/booking/:space_id/book' do
    @space_id = params[:space_id]
    @current_space = Spaces.find(params[:space_id])
    @availability = Spaces.availability(@space_id)
    erb(:booking)
  end

  post '/booking/:space_id/book' do
    redirect '/main_view'
  end

  post '/new_space' do
    Spaces.add_space(params[:space_name], params[:space_description], params[:price_per_night], params[:user_id])
    Spaces.add_availability(params[:stay_start], params[:stay_finish])
    redirect '/main_view'
  end
    
  get '/edit_space/:space_id/edit' do
    @space_id = params[:space_id]
    redirect '/main_view'
  end

  post '/edit_space/:space_id/edit' do
    # @space_id = params[:space_id]
    # Spaces.edit_space(params[:space_name], params[:space_description], params[:price_per_night], @user_id)
    # Spaces.add_availability(@space_id, params[:stay_start], params[:stay_finish])
    # erb(:edit_space)
  end

  get '/sign-up' do
    erb(:sign_up)
  end

  post '/sign-up-details' do
    # session['sign_up_data'] = params
    if SignUpValidator.password_valid?(params['password'], params['password_confirm'])
      # if SignUp.validate(params['username'], params['email'])
      user = User.add_user(username: params[:username], email: params[:email], fullname: params[:fullname], pw: params[:password])
      if user == nil
        flash[:details_in_use] = "Username or email already registered"
        redirect '/sign-up'
      else
        session[:user_id], session[:username] = user.user_id, user.username
        flash[:welcome] = "Welcome #{params[:username]}"
        redirect '/main_view'
      end
    else
      flash[:password_error] = "Passwords don't match!"
      redirect '/main_view'
    end
    # TODO create model to check if username and email are unique (commented out in sign_up.rb - requires database)
    # TODO have session['logged_in_user'] = User.instance
  end

  get '/booking/:space_id/book' do
    @current_space = params[:space_id]
    erb :booking
  end

  post '/booking/:space_id/book-confirmation' do
    @current_user = session[:user_id]
    @selected_availabilities = params[:selected_availabilities]

  end 

  post '/test' do
    p params
    @current_user = session[:user_id]
    dates_selected = []
    params.each_value do |value|
      dates_selected << Spaces.date_for_id
      p Request.add_request(availability_id: value, user_id: @current_user)
    end 

    flash[:thanks] = 'Thanks for your booking at space_id for dates_selected.each '

    redirect '/main_view'
  end

  
  get '/login' do
    erb :login
  end

  post '/login-details' do
    if User.unique?(params[:username])
      flash[:invalid_username] = "Username does not exist"
      redirect '/login'
    elsif User.authenticate(username: params[:username], password: params[:password])
      user = User.find_by(params[:username])
      session[:user_id] = user.user_id
      session[:username] = user.username
      redirect '/main_view'
    else
      flash[:invalid_password] = "Password does not match"
      redirect '/login'
    end
  end

  post '/log-out' do
    session[:user_id] = nil
    session[:username] = nil
    flash[:logout] = 'You have successfully logged out'
    redirect '/'
  end

  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end
