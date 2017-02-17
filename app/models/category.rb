class Category < ApplicationRecord
  acts_as_nested_set
  belongs_to :shop

  has_many :products, dependent: :destroy

  validates :name, presence: true, 
    length: {maximum: Settings.categories.name_max_length}, 
    uniqueness: {case_sensitive: false}

  scope :newest, ->{order created_at: :desc}
end
