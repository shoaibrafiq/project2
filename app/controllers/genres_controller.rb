class GenresController < ApplicationController

def index
end

def new
@genre = current_user.genres.build
end

def create
  @genre = current_user.genres.build(genre_params)

  if @genre.save
    redirect_to genres_path
  else
    render 'new'
  end
end

private

def genre_params
  params.require(:genre).permit(:name, :film_id )
  #define the information that the user can fill out and what we want to be able to use
  end

end
