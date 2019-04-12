class AddLongitudeToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :longitude, :float
  end
end
