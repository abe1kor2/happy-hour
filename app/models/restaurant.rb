class Restaurant < ApplicationRecord
  has_many :deals, dependent: :destroy
  validates :name, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # Order by name by default
  default_scope { order(name: :asc) }
end