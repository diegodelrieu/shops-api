class AddLatitudeToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :latitude, :float
  end
end
