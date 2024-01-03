class CreateBusinesses < ActiveRecord::Migration[6.0] # The version number may vary
  def change
    create_table :businesses do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.string :county, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.decimal :lat, null: false, precision: 10, scale: 6
      t.decimal :lon, null: false, precision: 10, scale: 6

      t.timestamps
    end
  end
end
