class CreateGardenLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :garden_locations do |t|
      t.references :garden, foreign_key: true
      t.references :garden_ownership, foreign_key: true
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
