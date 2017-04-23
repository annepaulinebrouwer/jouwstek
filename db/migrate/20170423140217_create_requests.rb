class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.references :garden, foreign_key: true
      t.text :message
      t.string :status
      t.timestamps
    end
  end
end
