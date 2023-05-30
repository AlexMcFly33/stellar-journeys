class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :journeys, :users
  has_many_attached :photos

  validates :name, :superficy, :gravity, :localisation, :number_of_guest, :price
end
