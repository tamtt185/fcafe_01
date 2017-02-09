class Shop < ApplicationRecord
  belongs_to :user
  belongs_to :album
  belongs_to :shop_type
    
  has_many :tables, dependent: :destroy
  has_many :coupons, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :categories, dependent: :destroy
end
