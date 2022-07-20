class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :property_id }
  belongs_to :user
  belongs_to :property
end
