class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  # Validates
  validates :title, :description, :category, :status, :user, presence: true


end
