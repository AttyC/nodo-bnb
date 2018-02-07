require 'sinatra/base'
# class for NodoBnB app
class Nodo < Sinatra::Base
enable :sessions

  get '/' do
    @user_name = session[:user_name]
    erb :'users/index'
  end

  post '/user' do
    session[:user_name] = params[:user_name]
    user = User.create(username: params[:user_name], password: params[:password])
    redirect to '/'
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
