class CreateGardenOwnerships < ActiveRecord::Migration[5.0]
  def change
    create_table :garden_ownerships do |t|
      t.references :user, foreign_key: true
      t.references :garden, foreign_key: true

      t.timestamps
    end
  end
end
