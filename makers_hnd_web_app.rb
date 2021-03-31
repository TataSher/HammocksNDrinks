require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/space_hammock.rb'
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
    @all_hammocks = SpaceHammock.all
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

  get '/space_hammocks/:id/book' do
    @booked = false # this causing confusion and it tells you you have succesfully booked when the hammock is already booked
    if session[:booked]
      @booked = true
      session[:booked] = false
    end
    session[:hammock] = SpaceHammock.find(params[:id])
    @hammock = session[:hammock]
    if @booked == false
      if @hammock.booked == 't'
        redirect '/space_hammocks/already_booked'
      end
    end
    erb :'/space_hammocks/booking_form'
  end

  post '/space_hammocks/:id/book' do
    @hammock = session[:hammock]
    user_id = 1
    session[:booked] = @hammock.book(user_id)
    redirect "/space_hammocks/#{params[:id]}/book"
  end

  get '/space_hammocks/already_booked' do
    @hammock = session[:hammock]
    erb :'/space_hammocks/already_booked'
  end

  run! if app_file == $0

end
