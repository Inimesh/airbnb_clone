require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/spaces'


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

  get '/add_space' do
    erb(:add_space)
  end

  get '/confirm_add' do
    erb(:confirm_add)
  end

  post '/new_space' do
    Spaces.add_space(params[:space_name], params[:space_description], params[:price_per_night])
    redirect '/confirm_add'
  end

  

  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end