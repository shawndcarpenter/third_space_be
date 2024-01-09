class DropMarkersTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :markers, if_exists: true
  end
end
