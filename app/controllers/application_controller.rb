class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, "carcollection"
  end

  helpers do
    def logged_in?
      !!session[:email]
    end
  end


  get '/' do
    'Hello World!'
  end
  #finally you want to mount the controller




end
