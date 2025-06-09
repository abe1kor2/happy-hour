class CreateDeals < ActiveRecord::Migration[8.0]
  def change
    create_table :deals, id: :uuid do |t|
      t.references :restaurant, null: false, foreign_key: true, type: :uuid
      t.string :day
      t.time :start_time
      t.time :end_time
      t.text :description

      t.timestamps
    end
  end
end
