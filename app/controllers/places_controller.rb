class PlacesController < ApplicationController

  def index
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.save
    redirect_to @place
  end

  def show
    @place = Place.find(params[:id])
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address1, :address2, :sity,
                                  :state, :zipcode, :country, :phone, :email, :category_id)
  end

end
