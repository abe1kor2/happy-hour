class CreateRestaurants < ActiveRecord::Migration[8.0]
  def change
    create_table :restaurants, id: :uuid do |t|
      t.string :name, null: false
      t.string :address
      t.string :phone
      t.string :website

      t.timestamps
    end
  end
end
