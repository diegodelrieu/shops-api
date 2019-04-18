class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :timestamp
      t.string :description

      t.timestamps
    end
  end
end
