require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "hotdogs"
  end

  get "/" do
    erb :welcome
  end

  # helper methods....

  def logged_in?
    # return true if logged_in, false otherwise
    !!current_author
  end

  def current_author
    # return the current_user object if there is one, nil otherwise
    Author.find_by(id: session[:author_id])
  end

end
