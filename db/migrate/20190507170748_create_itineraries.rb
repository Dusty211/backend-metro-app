class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.string :source_code
      t.string :source_name
      t.string :destination_code
      t.string :destination_name
      t.float :miles
      t.integer :time
      t.float :peak_fare
      t.float :off_peak_fare
      t.float :senior_fare
      t.datetime :arrivals_updated

      t.timestamps
    end
  end
end