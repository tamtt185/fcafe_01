class Product < ApplicationRecord
  belongs_to :category
  belongs_to :album
  
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :order_product_items, dependent: :destroy
end
