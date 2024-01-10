class ChangePhotosToBeStringInThirdSpaces < ActiveRecord::Migration[7.0]
  def change
    change_column(:third_spaces, :photos, :string)
  end
end
