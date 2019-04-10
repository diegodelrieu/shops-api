class AddBookedToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :booked, :boolean, default: false
  end
end
