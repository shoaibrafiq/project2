class ReviewsController < ApplicationController
#these action will take place before any other
before_action :find_film
before_action :find_review, only: [:edit, :update, :destroy]
before_action :authenticate_user!, only: [:new, :edit] #if user is logged in they can add and edit 

def new
  @review = Review.new
end

#creating review relating to film_Id and User_id
def create
  @review = Review.new(review_params)
  @review.film_id = @film.id
  @review.user_id = current_user.id

  if @review.save #saving review and redirecting to film path
    redirect_to film_path(@film)
  else
    render 'new'
  end
end

def edit
end

def update #updating review when edited
  if @review.update(review_params)
    redirect_to film_path(@film)
  else
    render 'edit'
  end

  def destroy #destroying the review when delete link is clicked
@review.destroy
redirect_to film_path(@film)
  end

end

private

def review_params #defining the review params and allowing the user to fill information in

params.require(:review).permit(:rating, :comment)

end

def find_film
  @film = Film.find(params[:film_id]) #film_id is used instead of id as review is associated with a film_id
end

def find_review
  @review = Review.find(params[:id])
end
end
