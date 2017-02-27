class Tag < ApplicationRecord
  has_many :taggings
  has_many :shops, through: :taggings
end
