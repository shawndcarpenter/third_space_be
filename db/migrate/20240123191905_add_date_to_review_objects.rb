class AddDateToReviewObjects < ActiveRecord::Migration[7.0]
  def change
    add_column :review_objects, :date, :string
  end
end
