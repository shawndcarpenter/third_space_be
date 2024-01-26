class CreateMarkers < ActiveRecord::Migration[7.0]
  def change
    create_table :markers do |t|
      t.string :name
      t.references :third_space, null: false, foreign_key: true

      t.timestamps
    end
  end
end
