class DealForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :deal

  attribute :restaurant_id, :string
  attribute :day, :string
  attribute :start_time, :time
  attribute :end_time, :time
  attribute :description, :string

  validates :day, :description, :restaurant_id, presence: true

  def save
    return false unless valid?
    persist
  end

  private

  def persist
    @deal ||= Deal.new
    @deal.assign_attributes(
      restaurant_id: restaurant_id,
      day: day,
      start_time: start_time,
      end_time: end_time,
      description: description
    )
    
    ActiveRecord::Base.transaction { @deal.save! }
    true
  rescue ActiveRecord::RecordInvalid => e
    e.record.errors.each { |error| errors.add(error.attribute, error.message) }
    false
  end
end
