require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/space_hammock.rb'
require_relative './lib/hammocks_n_drinks.rb'
require_relative './db_connection_setup'

class MakersHnDWebApp < Sinatra::Base
  enable :sessions, :method_override

  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader # this is from the Sinatra contrib gem
  end

  get '/' do
    'hello world'
  end

  get '/space_hammocks' do
    @all_hammocks = HammocksNDrinks.all
    p @all_hammocks
    erb :index
  end

  get '/space_hammocks/new' do
    erb :'/space_hammocks/new'
  end

  post '/space_hammocks' do
    SpaceHammock.create(params[:name], params[:description],
                           params[:price_per_night], 1) # 1 is proxy for user
    session[:name] = params[:name]
    redirect '/space_hammocks'
  end

  run! if app_file == $0
end
