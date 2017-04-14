class GenresController < ApplicationController
before_action :find_genre, only: [:show, :edit, :update, :destroy]

def index
  @genres = Genre.all.order("created_at DESC")

end

def new
  @genre = Genre.new
end

def create
  @genre = Genre.new(genre_params)

  if @genre.save
    redirect_to genres_path
  else
    render 'new'
  end
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
