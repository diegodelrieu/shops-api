class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :shop, foreign_key: true
      t.string :name
      t.string :description
      t.string :original_price
      t.string :discount_price
      t.integer :quantity
      t.string :expiry_time
      t.string :image_url

      t.timestamps
    end
  end
end
