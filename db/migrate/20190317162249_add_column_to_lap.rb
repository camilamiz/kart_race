class AddColumnToLap < ActiveRecord::Migration[5.2]
  def change
    add_column :laps, :lap_millisenconds, :integer
  end
end
