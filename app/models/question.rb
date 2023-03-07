class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  # Validates
  validates :title, :description, :category, :status, :user, presence: true

  include AASM

  aasm_column :status
  aasm do
    state :waiting, initial: true
    state :choosing, :paid, :answered, :ended, :discarted

    event :new_answer do
      transitions from: :waiting, to: :choosing
    end

    event :choose do
      transitions from: :choosing, to: :paid
    end

    event :answer_delivered do
      transitions from: :paid, to: :answered
    end

    event :finalize do
      transitions from: :answered, to: :ended
    end

    event :discard do
      transitions from: [:waiting, :choosing], to: :discarted
    end
  end
  # waiting, con_respuestas, pagada, respondida, terminada
end
