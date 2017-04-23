class CreateGardens < ActiveRecord::Migration[5.0]
  def change
    create_table :gardens do |t|
      t.integer :maximum_number_of_participants
      t.integer :head_gardener_id
      t.string :whatsapp_group_url

      t.timestamps
    end
    add_foreign_key :gardens, :users, column: "head_gardener_id"
    add_index :gardens, :head_gardener_id
  end
end
