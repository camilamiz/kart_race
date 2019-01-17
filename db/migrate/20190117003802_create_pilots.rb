class CreatePilots < ActiveRecord::Migration[5.2]
  def change
    create_table :pilots do |t|
      t.string :pilot_name

      t.timestamps
    end
  end
end
