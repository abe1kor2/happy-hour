class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.includes(:deals)
  end

  def show
    # @restaurant is set by the before_action
    @deals_by_day = @restaurant.deals.group_by(&:day)

    if @restaurant.latitude.present? && @restaurant.longitude.present?
      @marker = [{
        lat: @restaurant.latitude,
        lng: @restaurant.longitude,
        info_window_html: render_to_string(partial: "restaurants/map_popup", locals: { restaurant: @restaurant })
      }]
    end
  end

  def new
    @restaurant_form = RestaurantForm.new
  end

  def create
    @restaurant_form = RestaurantForm.new(restaurant_params)
    if @restaurant_form.save
      redirect_to restaurants_path, notice: "Restaurant created successfully."
    else
      flash.now[:alert] = "Error creating restaurant."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @restaurant_form = RestaurantForm.new(
      restaurant: @restaurant,
      **@restaurant.attributes.slice("name", "address", "phone", "website", "latitude", "longitude")
    )
  end

  def update
    @restaurant_form = RestaurantForm.new(restaurant_params.merge(restaurant: @restaurant))
    if @restaurant_form.save
      redirect_to restaurants_path, notice: "Restaurant updated successfully."
    else
      flash.now[:alert] = "Error updating restaurant."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, notice: "Restaurant deleted successfully.", status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to restaurants_path, alert: "Restaurant not found."
  end

  def restaurant_params
    params.require(:restaurant_form).permit(:name, :address, :phone, :website, :latitude, :longitude)
  end
end