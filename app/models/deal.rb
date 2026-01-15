class Deal < ApplicationRecord
  belongs_to :restaurant
  validates :day, :description, presence: true

  validates :day, presence: true
  validate :day_must_be_valid

  # Custom validation for time logic
  validate :end_time_is_after_start_time

  # Scope to find deals for a specific day
  scope :on_day, ->(day) { where("? = ANY(day)", day) }

  def everyday?
    DealDays.valid_keys.sort == day.sort
  end

  def weekend?
    day.sort == DealDays.weekends.sort
  end

  def weekday?
    day.sort == DealDays.weekdays.sort
  end

  private

  def day_must_be_valid
    return if day.blank?

    invalid_days = day - DealDays.valid_keys
    if invalid_days.any?
      errors.add(:day, "contains invalid days: #{invalid_days.join(', ')}")
    end
  end

  def end_time_is_after_start_time
    return if start_time.blank? || end_time.blank?

    if end_time <= start_time
      errors.add(:end_time, "must be after the start time")
    end
  end
end
