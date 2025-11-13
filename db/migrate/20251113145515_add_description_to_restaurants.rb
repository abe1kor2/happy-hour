class AddDescriptionToRestaurants < ActiveRecord::Migration[8.0]
  def change
    add_column :restaurants, :description, :text
  end
end
