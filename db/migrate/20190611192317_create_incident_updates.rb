class CreateIncidentUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :incident_updates do |t|

      t.timestamps
    end
  end
end
