class ChangeDayToArrayInDeals < ActiveRecord::Migration[8.0]
  def change
    # Change day from string to array of strings
    change_column :deals, :day, :string, array: true, default: [], using: "(string_to_array(day, ','))"

    # Add index for querying by specific days
    add_index :deals, :day, using: 'gin'
  end
end
