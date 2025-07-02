class DealsController < ApplicationController
  before_action :set_deal, only: [:edit, :update, :destroy]
  before_action :set_restaurant, only: [:new, :create]
  before_action :require_admin

  def new
    @deal_form = DealForm.new(restaurant_id: @restaurant.id)
  end

  def create
    @deal_form = DealForm.new(deal_params.merge(restaurant_id: @restaurant.id))
    if @deal_form.save
      redirect_to restaurant_path(slug: @restaurant.slug), notice: "Deal created successfully."
    else
      flash.now[:alert] = "Error creating deal."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @deal_form = DealForm.new(
      deal: @deal,
      **@deal.attributes.slice("restaurant_id", "day", "start_time", "end_time", "description")
    )
  end

  def update
    @deal_form = DealForm.new(deal_params.merge(deal: @deal))
    if @deal_form.save
      redirect_to restaurant_path(slug: @deal.restaurant.slug), notice: "Deal updated successfully."
    else
      flash.now[:alert] = "Error updating deal."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    restaurant = @deal.restaurant
    @deal.destroy
    redirect_to restaurant_path(restaurant), notice: "Deal deleted successfully.", status: :see_other
  end

  private

  def set_deal
    @deal = Deal.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to restaurants_path, alert: "Deal not found."
  end

  def set_restaurant
    @restaurant = Restaurant.find_by(slug: params[:slug]) || Restaurant.find(params[:restaurant_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to restaurants_path, alert: "Associated restaurant not found."
  end

  def deal_params
    params.require(:deal_form).permit(:day, :start_time, :end_time, :description, :restaurant_id)
  end
end
