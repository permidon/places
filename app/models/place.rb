class Place < ApplicationRecord

  has_many :reviews
  belongs_to :category

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :state
  validates_presence_of :city

  geocoded_by :full_address
  after_validation :geocode

  mount_uploader :image, ImageUploader

  def full_address
    [address1, address2, city, state, zipcode].join(', ')
  end

  def self.search(params)
    places = Place.where(category_id: params[:category].to_i)
    places = places.where("name like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    places = places.near(params[:location], 20) if params[:location].present?
    places
  end
  
end