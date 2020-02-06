require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  # sign up route

  # login route
  # shows a login form

  # sessions create route

  # logout route

end
