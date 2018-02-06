require 'sinatra/base'

class Nodo < Sinatra::Base

  get '/' do
    erb :'users/index'
  end



end
