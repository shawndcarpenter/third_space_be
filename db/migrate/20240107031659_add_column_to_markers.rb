class AddColumnToMarkers < ActiveRecord::Migration[7.0]
  def change
    add_column :markers, :tags, :string, array: true, default: []
  end
end
