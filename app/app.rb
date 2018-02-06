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
    redirect to '/'
  end

  get '/spaces/new' do
    erb :'spaces/space'
  end

  get '/spaces/space' do
    erb :'spaces/index'
  end

  post '/space' do
    redirect to '/spaces/space'
  end
end
