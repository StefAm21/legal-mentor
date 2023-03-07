class Review < ApplicationRecord
  belongs_to :user
  # Validates
  validates :rating, :comment, presence: true
end
