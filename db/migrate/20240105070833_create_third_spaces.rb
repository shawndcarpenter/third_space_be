class CreateThirdSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :third_spaces do |t|
      t.string :yelp_id
      t.string :name
      t.string :address
      t.float :rating
      t.string :phone
      t.string :photos, array: true, default: []
      t.float :lat
      t.float :lon
      t.string :price
      t.jsonb :hours
      t.boolean :open_now
      t.string :category
      t.string :tags, array: true, default: []
      t.timestamps
    end
  end
end
