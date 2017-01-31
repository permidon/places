class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to @place
    else
      flash[:danger] = @place.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def show
    @place = Place.find(params[:id])
    @reviews = Review.where(place_id: @place)
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  def search
    if params[:category].blank?
      @places = Place.all
    else
      @places = Place.search(params)
    end

  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address1, :address2, :city, :image,
                                  :state, :zipcode, :country, :phone, :email, :category_id)
  end

end
