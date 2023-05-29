class Spaceship < ApplicationRecord
  belongs_to :user_id

  validates :name, :superficy, :gravity, :localisation, :number_of_guest, :price
end
