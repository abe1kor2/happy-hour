class Restaurant < ApplicationRecord
  has_many :deals, dependent: :destroy
  validates :name, presence: true

  # Order by name by default
  default_scope { order(name: :asc) }
end