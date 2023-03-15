class Study < ApplicationRecord
  belongs_to :user
  validates :title, :university, :start_date, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "must be after start date") if end_date < start_date
  end
end
