class MapsController < ApplicationController
  def show
    @restaurants = Restaurant.where.not(latitude: nil, longitude: nil)
    @markers = @restaurants.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        info_window_html: render_to_string(partial: "restaurants/map_popup", locals: { restaurant: restaurant })
      }
    end
  end
end