class CreateLines < ActiveRecord::Migration[5.2]
  def change
    create_table :lines do |t|
      t.string :color
      t.string :code

      t.timestamps
    end
  end
end
