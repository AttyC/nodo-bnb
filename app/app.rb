require 'sinatra/base'

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

end
