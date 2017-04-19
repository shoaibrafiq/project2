class ReviewsController < ApplicationController
before_action :find_film #this action will take place before any other

def new
  @review = Review.new
end

def create
  @review = Review.new(review_params)
  @review.film_id = @film.id
  @review.user_id = current_user.id

  if @review.save
    redirect_to film_path(@film)
  else
    render 'new'
  end
end

private

def review_params

params.require(:review).permit(:rating, :comment)

end

def find_film
  @film = Film.find(params[:film_id]) #film_id is used instead of id as review is associated with a film_id
end

end
