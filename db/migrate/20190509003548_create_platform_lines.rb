class CreatePlatformLines < ActiveRecord::Migration[5.2]
  def change
    create_table :platform_lines do |t|
      t.references :line, foreign_key: true
      t.references :platform, foreign_key: true

      t.timestamps
    end
  end
end
