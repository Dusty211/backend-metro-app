class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents do |t|
      t.text :description
      t.string :incident_type
      t.string :lines_affected
      t.references :incident_update, foreign_key: true

      t.timestamps
    end
  end
end
