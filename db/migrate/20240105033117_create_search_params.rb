class CreateSearchParams < ActiveRecord::Migration[7.0]
  def change
    create_table :search_params do |t|
      t.string :name
      t.string :city
      t.timestamps
    end
  end
end
