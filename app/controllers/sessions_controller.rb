class SessionsController < ApplicationController

  # the routes that will live here will be ....

  # login & logout

  # LOGIN:

  # renders the login form
  get '/login' do
    erb :"/sessions/new"
  end

  # receives the login form once submitted
  post '/login' do
    # find the author using the username or email
    author = Author.find_by(email: params[:author][:email])

    if author && author.authenticate(params[:author][:password])# we find the author AND they author is authenticated
      # success
      # show the author their landing page
      # add a key/value pair to the session hash
      session[:author_id] = author.id # <-- this is the act of logging someone in!
      binding.pry
      redirect to "/authors/#{author.id}"
    else
      # failure
      # the credentials were invalid
      # invite the user to try again or sign up
    end
  end

  post '/logout' do
    session.clear
    redirect to '/'
  end
end
