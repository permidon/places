class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?, only: [:edit, :update, :destroy]

  def index
    visitor_latitude = request.location.latitude
    visitor_longitude = request.location.longitude

    @places = Place.near([visitor_latitude, visitor_longitude], 20)
    @hotels = Place.where(category_id: 1).near([visitor_latitude, visitor_longitude], 20)
    @restaurants = Place.where(category_id: 2).near([visitor_latitude, visitor_longitude], 20)
    @cafes = Place.where(category_id: 3).near([visitor_latitude, visitor_longitude], 20)
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

    @reviews = Review.where(place_id: @place)
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  def edit
  end

  def update
    @place.update(place_params)
    redirect_to @place
  end

  def destroy
    @place.destroy
    redirect_to root_path
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

  def set_place
    @place = Place.find(params[:id])
  end

  def is_admin?
    if !current_user.try(:admin?)
      redirect_to root_path
      flash[:danger] = "You are not authorized to edit or delete."
    end
  end

end
