class Table < ApplicationRecord
  belongs_to :album
  belongs_to :shop
  
  has_many :order_tables, dependent: :destroy
  has_many :order_products, dependent: :destroy
end
