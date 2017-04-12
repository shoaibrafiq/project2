class FilmsController < ApplicationController
  before_action :find_film, only: [:show, :edit, :update, :destroy]
    #before any of the actions below this function will be intiate, in this case we want to find the film for the show, edit, update and destroy actions

#def is defining the action, then name of the action and end of action
# '@film' is an instance variable which is used in the views

  def index
    @films = Film.all.order("created_at DESC") #display books with the most recent at the top and oldest at the bottom
  end

  def show
    end

  def new
    @film = current_user.films.build #relating this to the current_user id
  end

  def create
    @film = current_user.films.build(film_params)

    if @film.save
      redirect_to root_path #this will redirect to index page as root path is set as index
    else
      render 'new' #redirect to new page
    end
  end

  def edit
  end

  def update #checks if film is updated successfully
    if @film.update(film_params)
      redirect_to film_path(@film)
    else
      render 'edit' #redirect to edit page
  end
end

  def destroy
    @film.destroy
    redirect_to root_path
  end

  private

  def film_params
    params.require(:film).permit(:title, :plot, :actor) #define the information that the user can fill out and what we want to be able to use
    end
  #when the user fills in information and sends a request its going to be passed with the information the user filled out in a form

def find_film
  @film = Film.find(params[:id]) #find a film by id and put it in the instance variable
end

end
