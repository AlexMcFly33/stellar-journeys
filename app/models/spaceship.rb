class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :journeys
  has_many :users
  has_many_attached :photos

  validates :name, presence: true
  validates :superficy, presence: true
  validates :localisation, presence: true
  validates :number_of_guest, presence: true
  validates :price, presence: true
end
