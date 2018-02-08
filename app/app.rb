ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'datamapper_setup'
require 'sinatra/flash'
# class for NodoBnB app
class Nodo < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions

  helpers do
    def get_user
      @user ||= User.get(session[:id])
    end
  end

  get '/' do # this is the signup path
    get_user
    erb :'users/index'
  end

  delete '/logout' do
    session[:id] = nil
    flash.keep[:notice] = 'Thank you for visiting NodoBnB'
    redirect to '/login'
  end

  get '/login' do
    erb :'users/login'
  end

  post '/user/login' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:id] = user.id
      redirect to '/spaces'
    else
      flash.next[:notice] = 'Please enter the correct login details'
      redirect to '/login'
    end
  end

  post '/user/new' do
    user = User.create(username: params[:username], password: params[:password])
    session[:id] = user.id
    redirect to '/spaces'
  end

  get '/spaces' do
    get_user
    @space = Space.all
    erb :'spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/space'
  end

  post '/spaces/new' do
    get_user
    if !@user.nil?
      Space.create(
        name: params[:name],
        description: params[:description],
        price: params[:price],
        from_date: params[:from_date],
        to_date: params[:to_date],
        user_id: session[:id]
      )
      flash.next[:notice] = 'Your space is listed'
      redirect to '/spaces'
    else
      flash.keep[:notice] = 'Please log in to list a space'
      redirect to '/login'
    end
  end

  patch '/spaces/:id' do
    space = Space.get(params[:id])
    space.update(booking: 'pending')
    flash.keep[:notice] = 'Successfully requested booking'
    redirect to '/spaces'
  end
end
