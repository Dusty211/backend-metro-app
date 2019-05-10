class CreatePlatformItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :platform_itineraries do |t|
      t.references :platform, foreign_key: true
      t.references :itinerary, foreign_key: true

      t.timestamps
    end
  end
end
