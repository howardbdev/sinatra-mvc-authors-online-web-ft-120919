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

  get '/authors/new' do
    erb :"/authors/new"
  end

  post '/authors' do

    author = Author.new(params["author"])
    
    if author.save
      redirect to "/authors"
    else
      @errors = author.errors.full_messages
      erb :"/authors/new"
    end
  end

  get '/authors/:id' do
    @author = Author.find_by_id(params[:id])
    erb :"/authors/show"
  end
  
  get '/authors/:id/edit' do
    @author = Author.find_by_id(params[:id])
    erb :"/authors/edit"
  end
  
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
