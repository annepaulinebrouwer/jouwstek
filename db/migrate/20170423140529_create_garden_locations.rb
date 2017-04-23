class CreateGardenLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :garden_locations do |t|
      t.references :garden, foreign_key: true
      t.string :city
      t.string :street_name
      t.string :postal_code
      t.string :house_number
      t.string :country
      t.string :extra_information
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
