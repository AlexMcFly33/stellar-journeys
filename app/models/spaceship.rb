class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :journeys
  has_many :users
  has_one_attached :photo

  validates :name, presence: true
  validates :superficy, presence: true
  validates :localisation, presence: true
  validates :number_of_guest, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
