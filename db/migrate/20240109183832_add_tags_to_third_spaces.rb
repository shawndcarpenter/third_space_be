class AddTagsToThirdSpaces < ActiveRecord::Migration[7.0]
  def change
    add_column :third_spaces, :tags, :string, array: true, default: []
  end
end
