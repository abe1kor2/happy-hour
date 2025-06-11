class AddLatitudeAndLongitudeToRestaurants < ActiveRecord::Migration[8.0]
  def change
    add_column :restaurants, :latitude, :decimal
    add_column :restaurants, :longitude, :decimal
  end
end
