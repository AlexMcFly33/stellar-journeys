class Journey < ApplicationRecord
  belongs_to :user
  belongs_to :spaceship
end
