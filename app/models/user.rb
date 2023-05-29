class User < ApplicationRecord
  validates :fisrt_name, :last_name, presence: true
end
