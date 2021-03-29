require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'

class MakersHnDWebApp < Sinatra::Base
  enable :sessions, :method_override

  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader # this is from the Sinatra contrib gem
  end

  get '/' do
    'hello world'
  end

  get '/hammocks_listings' do
    erb :index
  end
  
  run! if app_file == $0
end
