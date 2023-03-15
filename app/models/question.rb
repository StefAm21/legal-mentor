class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  scope :find_all_questions, -> { order("created_at DESC") }

  include PgSearch::Model
  pg_search_scope :search_by_category,
    against: [ :category ],
    using: {
      tsearch: { prefix: true }
    }

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

    event :choosed do # Choosed and get paid
      transitions from: :choosing, to: :paid
    end

    event :answer_delivered do # With attachment
      transitions from: :paid, to: :answered
    end

    event :finalize do # Leave with review
      transitions from: :answered, to: :ended
    end

    event :discard do # Rejected
      transitions from: [:waiting, :choosing], to: :discarted
    end
  end
  # waiting, con_respuestas, pagada, respondida, terminada
end
