class Shop < ApplicationRecord
  belongs_to :user
  belongs_to :shop_type

  has_many :tables, dependent: :destroy
  has_many :coupons, dependent: :destroy
  has_many :rates
  has_many :comments
  has_many :categories
  has_many :albums, dependent: :destroy

  enum status: [:waiting, :approved, :rejected]

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true

  mount_uploader :avatar, PictureUploader

  scope :order_date_desc, -> {order created_at: :desc}
end
