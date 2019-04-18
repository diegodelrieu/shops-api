class AddCustomerIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :customer_id, :integer
  end
end
