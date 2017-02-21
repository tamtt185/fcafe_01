class Table < ApplicationRecord
  belongs_to :shop

  has_many :order_tables, dependent: :destroy
  has_many :order_products, dependent: :destroy

  validates_uniqueness_of :name, scope: :shop_id

  scope :newest, -> {order created_at: :desc}

  mount_uploader :avatar, PictureUploader
end
