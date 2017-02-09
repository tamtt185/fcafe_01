class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :order_products, dependent: :destroy
  has_many :order_tables, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  has_many :shops, dependent: :destroy
end
