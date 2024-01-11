class CreateReviewObjects < ActiveRecord::Migration[7.0]
  def change
    create_table :review_objects do |t|
      t.string :yelp_id
      t.string :name
      t.string :text
      t.string :rating

      t.timestamps
    end
  end
end
