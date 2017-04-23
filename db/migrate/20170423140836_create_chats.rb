class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps
    end
    add_foreign_key :chats, :users, column: "sender_id"
    add_index :chats, :sender_id
    add_foreign_key :chats, :users, column: "receiver_id"
    add_index :chats, :receiver_id
  end
end
