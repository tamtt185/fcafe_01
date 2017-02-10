class Suggestion < ApplicationRecord
  belongs_to :album
  belongs_to :shop
    
  has_many :order_tables, dependent: :destroy  
end
