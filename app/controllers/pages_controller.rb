class PagesController < ApplicationController

  def about_us
  end

  def contacts_us
  end

  def hotels
    @hotels = Place.where(category_id: 1)
  end

  def restaurants
    @restaurants = Place.where(category_id: 2)
  end

  def cafes
    @cafes = Place.where(category_id: 3)
  end

end
