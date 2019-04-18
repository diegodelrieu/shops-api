class AddShopIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :shop_id, :string
  end
end
