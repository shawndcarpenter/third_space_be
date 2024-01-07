class RemoveTagsFromThirdSpaces < ActiveRecord::Migration[7.0]
  def change
    remove_column :third_spaces, :tags, :text, array: true, default: []
  end
end
