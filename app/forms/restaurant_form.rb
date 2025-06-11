class RestaurantForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :restaurant

  attribute :name, :string
  attribute :address, :string
  attribute :phone, :string
  attribute :website, :string
  attribute :latitude, :float
  attribute :longitude, :float

  validates :name, presence: true

  def save
    return false unless valid?
    persist
  end

  private

  def persist
    @restaurant ||= Restaurant.new
    @restaurant.assign_attributes(name: name, address: address, phone: phone, website: website, latitude: latitude, longitude: longitude)
    
    # Use a transaction and capture specific errors
    ActiveRecord::Base.transaction do
      @restaurant.save!
    end
    true
  rescue ActiveRecord::RecordInvalid => e
    # Transfer model errors to the form object
    e.record.errors.each { |error| errors.add(error.attribute, error.message) }
    false
  end
end
