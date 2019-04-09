class AddTokenToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :authentication_token, :string, limit: 30
    add_index :shops, :authentication_token, unique: true
  end
end
