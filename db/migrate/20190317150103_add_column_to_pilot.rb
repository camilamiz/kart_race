class AddColumnToPilot < ActiveRecord::Migration[5.2]
  def change
    add_column :pilots, :pilot_code, :string
  end
end
