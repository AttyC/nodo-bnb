require 'sinatra/base'
require_relative 'datamapper_setup'
# class for NodoBnB app
class Nodo < Sinatra::Base
enable :sessions

  helpers do
    def get_user
      @user ||= User.get(session[:id])
    end
  end

  get '/' do   #this is the signup path
    get_user
    erb :'users/index'
  end

  get '/login' do
    erb :'users/login'
  end

  post '/user/login' do
    user = User.authenticate(params[:username], params[:password])
    session[:id] = user.id
    redirect to '/spaces'
  end

  post '/user/new' do
    user = User.create(username: params[:username], password: params[:password])
    session[:id] = user.id
    redirect to '/'
  end

  get '/spaces' do
    get_user
    erb :'spaces/spaces'
  end

  get '/spaces/new' do
    erb :'spaces/space'
  end

  get '/spaces/space' do
    @space = Space.first
    erb :'spaces/index'
  end

  post '/space/new' do
    Space.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      from_date: params[:from_date],
      to_date: params[:to_date]
    )
    redirect to '/spaces/space'
  end
end
