class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :description
      t.string :avatar_url
      t.string :opening_hours
      t.integer :rating_from_diaping

      t.timestamps
    end
  end
end
