class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
      t.string :cars
      t.string :destination_code
      t.string :destination_name
      t.string :line
      t.string :minutes
      t.references :itinerary, foreign_key: true

      t.timestamps
    end
  end
end
