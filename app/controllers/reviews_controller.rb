class ReviewsController < ApplicationController
  before_action :set_place
  before_action :authenticate_user!

  def new
    @review = Review.new(place: @place)
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review.place = @place
    @review.save
    redirect_to @place
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_place
    @place = Place.find(params[:place_id])
  end

end