class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  # Response in pdf
  has_one_attached :photo
  has_one :payment


  # Validations
  validates :price, :comment, :avg_time, :payment_status, :user, :question, presence: true

  include AASM

  aasm_column :payment_status
  aasm do
    state :sent, initial: true
    state :accepted, :rejected, :paid, :ended, :discarted

    event :accept do
      transitions from: :sent, to: :accepted
    end

    event :reject do
      transitions from: :sent, to: :rejected
    end

    event :pay do
      transitions from: :accepted, to: :paid
    end

    event :finalize do
      transitions from: :paid, to: :ended
    end

    event :discard do
      transitions from: :sent, to: :discarted
    end
  end
  # waiting, con_respuestas, pagada, respondida, terminada
end
