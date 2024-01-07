class CreateUserThirdSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :user_third_spaces do |t|
      t.references :third_space, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
