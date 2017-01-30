class Place < ApplicationRecord

  has_many :reviews
  belongs_to :category

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :state
  validates_presence_of :city

end