class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
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
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address1, :address2, :sity,
                                  :state, :zipcode, :country, :phone, :email, :category_id)
  end

end
