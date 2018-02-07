ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'datamapper_setup'
# class for NodoBnB app
class Nodo < Sinatra::Base
enable :sessions

  get '/' do
    @user_name = User.first
    erb :'users/index'
  end

  post '/user' do
    User.create(username: params[:user_name], password: params[:password])
    redirect to '/'
  end

  get '/spaces/new' do
    erb :'spaces/space'
  end

  get '/spaces' do
    @space = Space.all
    # p '1'
    # p @space
    erb :'spaces/index'
  end

  post '/spaces/new' do
    Space.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      from_date: params[:from_date],
      to_date: params[:to_date]
    )
    p "HEELLPPPPPPP"
    p Space.all
    redirect to '/spaces'
  end
end
