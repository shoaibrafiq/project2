class FilmsController < ApplicationController

#def is defining the action, then name of the action and end of action
# '@film' is an instance variable which is used in the views

  def index
  end

  def new
    @film = Film.new
  end


  def create
    @film = Film.new(film_params)

    if @film.save
      redirect_to root_path #this will redirect to index page as path is set as index
    else
      render 'new' #redirect to new page
    end
  end

  private

  def film_params
    params.require(:film).permit(:title, :plot, :actor)

  end
  #when the user fills in information and sends a request its going to be passed with the information the user filled out in a form
#define the information that the user can fill out and what we want to be able to use


end
