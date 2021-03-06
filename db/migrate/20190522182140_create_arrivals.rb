class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
      t.string :cars
      t.string :destination
      t.string :line
      t.string :minutes
      t.references :platform, foreign_key: true

      t.timestamps
    end
  end
end
