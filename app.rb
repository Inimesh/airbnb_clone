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

  

  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end