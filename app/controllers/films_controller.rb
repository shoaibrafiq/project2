class FilmsController < ApplicationController
  before_action :find_film, only: [:show, :edit, :update, :destroy]
    #before any of the actions below this function will be intiate, in this case we want to find the film for the show, edit, update and destroy actions


  def index
#if statement is for if there is nothing being passed and user is still on the route page then display books with the most recent at the top and oldest at the bottom
    if params[:genre].blank?
    @films = Film.all.order("created_at DESC")
  else
#when filtered by genres then display books in descending order relating to the genre selected in views page
    @genre_id = Genre.find_by(name: params[:genre]).id
    @films = Film.where(:genre_id => @genre_id).order("created_at DESC")
  end
  end

  def show
    end

  def new
    @film = current_user.films.build #relating this to the current_user id
    @genres = Genre.all.map { |c| [c.name, c.id]  } #this is used when creating select_tag for dropdown menu in the form options_for_select requires an array of arrays which provides the text for the drop down option
  end

  def create
    @film = current_user.films.build(film_params)
    @film.genre_id = params[:genre_id] #associating films with genre

    if @film.save
      redirect_to root_path #this will redirect to index page as root path is set as index
    else
      render 'new' #redirect to new page
    end
  end

  def edit
    @genres = Genre.all.map { |c| [c.name, c.id]  }
  end

  def update #checks if film is updated successfully
    @film.genre_id = params[:genre_id]
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
    params.require(:film).permit(:title, :plot, :actor, :genre_id)
    #define the information that the user can fill out and what we want to be able to use
    end
  #when the user fills in information and sends a request its going to be passed with the information the user filled out in a form

def find_film
  @film = Film.find(params[:id]) #find a film by id and put it in the instance variable
end

end
