class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :shop

  delegate :user_name, to: :user, allow_nil: true
  delegate :avatar, to: :user, prefix: true, allow_nil: true
end
