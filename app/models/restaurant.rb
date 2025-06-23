class Restaurant < ApplicationRecord
  has_many :deals, dependent: :destroy
  validates :name, presence: true

  has_one_attached :photo

  before_validation :generate_slug, if: -> { name_changed? || slug.blank? }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # Order by name by default
  default_scope { order(name: :asc) }

  private
  def generate_slug
    self.slug = name.parameterize if name.present?
  end
end
