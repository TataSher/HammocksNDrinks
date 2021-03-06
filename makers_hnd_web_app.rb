require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/space_hammock.rb'
require_relative './db_connection_setup'
require_relative './lib/user'

class MakersHnDWebApp < Sinatra::Base
  enable :sessions, :method_override

  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader # this is from the Sinatra contrib gem
  end

  get '/' do
    @username = session[:username]
    erb :front_page
  end

  get '/space_hammocks' do
    @all_hammocks = SpaceHammock.all
    @username = session[:username]
    erb :index
  end

  get '/space_hammocks/new' do
    @username = session[:username]
    erb :'/space_hammocks/new'
  end

  post '/space_hammocks' do
    SpaceHammock.create(params[:name], params[:description],
                           params[:price_per_night], session[:user_id]) # 1 is proxy for user
    session[:name] = params[:name]
    redirect '/space_hammocks'
  end

  get '/space_hammocks/:id/book' do
    @username = session[:username]
    @booked = false
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
    session[:booked] = @hammock.book(session[:user_id])
    redirect "/space_hammocks/#{params[:id]}/book"
  end

  get '/space_hammocks/already_booked' do
    @username = session[:username]
    @hammock = session[:hammock]
    erb :'/space_hammocks/already_booked'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(params[:email], params[:password], params[:name], params[:username])
    if user
      session[:username] = user.username
      session[:user_id] = user.id
      redirect '/space_hammocks'
    else
      flash[:error] = 'Email or Username already exists.'
      redirect('/users/new')
    end
  end

  get '/sessions/new' do
    erb(:'/sessions/new')
  end

  post '/sessions' do
    user = User.sign_in(params[:email], params[:password])
    if user
      session[:username] = user.username
      session[:user_id] = user.id
      redirect('/space_hammocks')
    else
      flash[:error] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  get '/sessions/destroy' do
    session.clear
    redirect('/space_hammocks')
  end

  run! if app_file == $0
end
