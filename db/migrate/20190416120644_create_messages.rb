class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :ToUserName
      t.string :FromUserName
      t.string :CreateTime
      t.string :MsgType
      t.string :Content
      t.integer :MsgId

      t.timestamps
    end
  end
end
