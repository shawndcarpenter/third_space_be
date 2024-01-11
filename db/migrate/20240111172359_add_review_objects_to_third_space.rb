class AddReviewObjectsToThirdSpace < ActiveRecord::Migration[7.0]
  def change
    add_column :review_objects, :third_space_id, :integer
    add_index  :review_objects, :third_space_id
  end
end
