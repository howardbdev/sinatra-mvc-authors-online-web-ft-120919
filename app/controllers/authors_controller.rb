class AuthorsController < ApplicationController
  # RESTful routing

  # define my index action:
  get '/authors' do
    # get all authors
    # create an instance variable to hold them
    @authors = Author.all
    # render the authors index view
    erb :"/authors/index"
  end
end
