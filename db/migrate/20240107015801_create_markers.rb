class CreateMarkers < ActiveRecord::Migration[7.0]
  def change
    create_table :markers do |t|
      t.string :gender_neutral_restrooms, array: true, default: []
      t.string :volume, array: true, default: []
      t.string :accessible_entrance, array: true, default: []
      t.string :customer_restrooms, array: true, default: []
      t.string :parking, array: true, default: []
      t.string :purchase_necessary, array: true, default: []
      t.string :sober, array: true, default: []
      t.string :child_friendly, array: true, default: []
      t.string :light_level, array: true, default: []
      t.string :public_transportation_nearby, array: true, default: []
      t.string :bipoc_friendly, array: true, default: []
      t.string :queer_friendly, array: true, default: []
      t.string :staff_responsiveness, array: true, default: []
      t.timestamps
    end
  end
end
