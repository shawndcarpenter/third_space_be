class RemoveColumnsFromThirdSpace < ActiveRecord::Migration[7.0]
  def change
    remove_column :third_spaces, :gender_neutral_restrooms, :text, array: true, default: []
    remove_column :third_spaces, :volume, :text, array: true, default: []
    remove_column :third_spaces, :accessible_entrance, :text, array: true, default: []
    remove_column :third_spaces, :customer_restrooms, :text, array: true, default: []
    remove_column :third_spaces, :parking, :text, array: true, default: []
    remove_column :third_spaces, :purchase_necessary, :text, array: true, default: []
    remove_column :third_spaces, :sober, :text, array: true, default: []
    remove_column :third_spaces, :child_friendly, :text, array: true, default: []
    remove_column :third_spaces, :light_level, :text, array: true, default: []
    remove_column :third_spaces, :public_transportation_nearby, :text, array: true, default: []
    remove_column :third_spaces, :bipoc_friendly, :text, array: true, default: []
    remove_column :third_spaces, :queer_friendly, :text, array: true, default: []
    remove_column :third_spaces, :staff_responsiveness, :text, array: true, default: []
  end
end
