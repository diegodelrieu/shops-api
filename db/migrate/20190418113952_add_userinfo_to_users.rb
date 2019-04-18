class AddUserinfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickName, :string
    add_column :users, :gender, :string
    add_column :users, :language, :string
    add_column :users, :city, :string
    add_column :users, :province, :string
    add_column :users, :country, :string
    add_column :users, :avatarUrl, :string
  end
end
