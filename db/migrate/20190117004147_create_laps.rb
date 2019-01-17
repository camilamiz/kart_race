class CreateLaps < ActiveRecord::Migration[5.2]
  def change
    create_table :laps do |t|
      t.time :lap_hour
      t.integer :lap_number
      t.time :lap_time
      t.float :lap_average_speed
      t.references :pilot, foreign_key: true

      t.timestamps
    end
  end
end
