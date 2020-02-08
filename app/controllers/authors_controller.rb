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

  # authors new action
  get '/signup' do
    erb :"/authors/new"
  end

  # authors create action
  post '/signup' do

    author = Author.new(params["author"])

    if author.save
      session[:author_id] = author.id
      redirect to "/authors"
    else
      @errors = author.errors.full_messages
      erb :"/authors/new"
    end
  end

  # authors show action
  get '/authors/:id' do
    @author = Author.find_by_id(params[:id])
    erb :"/authors/show"
  end

  # authors edit action
  get '/authors/:id/edit' do
    @author = Author.find_by_id(params[:id])
    if @author == current_author
      # show the form
      erb :"/authors/edit"
    else
      # not authorized
      # send somewhere else
      # tell the user "get outta here"
      redirect '/'
    end
  end

  # authors update action
  patch '/authors/:id' do
    @author = Author.find_by_id(params[:id])

    if @author.update(params[:author])
      redirect to "/authors/#{@author.id}"
    else
      erb :"/authors/edit"
    end
  end


  delete '/authors/:id' do
    @author = Author.find_by_id(params[:id])
    if @author
      @author.destroy
    end
    redirect to "/authors"
  end

end
