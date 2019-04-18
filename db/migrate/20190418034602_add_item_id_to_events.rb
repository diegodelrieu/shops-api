class AddItemIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :item_id, :string
  end
end
