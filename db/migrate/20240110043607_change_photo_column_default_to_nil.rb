class ChangePhotoColumnDefaultToNil < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:third_spaces, :photos, nil)
  end
end
