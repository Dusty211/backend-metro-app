class CreatePlatforms < ActiveRecord::Migration[5.2]
  def change
    create_table :platforms do |t|
      t.string :type
      t.string :code
      t.string :name
      t.string :alt_code
      t.float :lat
      t.float :lon
      t.datetime :arrivals_updated

      t.timestamps
    end
  end
end
