class GenresController < ApplicationController
  #these actions will take place before any other
before_action :find_genre, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, only: [:new, :edit] #if user is logged in they can add and edit

def index #displaying genres in descending order
  @genres = Genre.all.order("created_at DESC")

end

def new
  @genre = current_user.genres.build #linked to current user
end

def create #creating and saving genres
  @genre = current_user.genres.build(genre_params)

  if @genre.save
    redirect_to genres_path
  else
    render 'new'
  end
end

def edit
end

def update #update action is called when edited
  if @genre.update(genre_params)
    redirect_to genre_path(@genre)
  else
    render 'edit'
  end
end

def destroy
  @genre.destroy
  redirect_to genres_path
end

private

def genre_params
  params.require(:genre).permit(:name, :description, :film_id )
  #define the information that the user can fill out and what we want to be able to use
  end

  def find_genre
    @genre = Genre.find(params[:id])
  end

end
