class AddLongitudeToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :longitude, :integer
  end
end
