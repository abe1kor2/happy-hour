class Deal < ApplicationRecord
  belongs_to :restaurant
  validates :day, :description, presence: true

  # Custom validation for time logic
  validate :end_time_is_after_start_time

  private

  def end_time_is_after_start_time
    return if start_time.blank? || end_time.blank?

    if end_time <= start_time
      errors.add(:end_time, "must be after the start time")
    end
  end
end