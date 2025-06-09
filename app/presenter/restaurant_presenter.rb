class RestaurantPresenter < BasePresenter
  presents :restaurant

  def full_contact
    [restaurant.address, restaurant.phone].compact.reject(&:blank?).join(' | ')
  end

  def website_link
    return unless restaurant.website.present?
    h.link_to "Visit Website", restaurant.website, target: "_blank", rel: "noopener noreferrer", class: "text-sm text-blue-500 hover:underline"
  end
end
