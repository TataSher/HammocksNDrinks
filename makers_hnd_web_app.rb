require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/SpaceHammock.rb'

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
    @hammock = SpaceHammock.new('Sharkie', 'coolest hammock', '1000', 'Lou') 
    erb :index
  end
  
  run! if app_file == $0
end
