class AddThirdSpaceIdToMarkers < ActiveRecord::Migration[7.0]
  def change
    add_column :markers, :third_space_id, :integer
    add_index  :markers, :third_space_id
  end
end
