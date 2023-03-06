class Review < ApplicationRecord
  belongs_to :user

  # Validates
  validate :rating, :comment, presence: true
end
