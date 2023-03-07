class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  # Response in pdf
  has_one_attached :photo

  # Validations
  validates :price, :comment, :avg_time, :payment_status, :user, :question, presence: true

end
