class CreateCrops < ActiveRecord::Migration[5.0]
  def change
    create_table :crops do |t|
      t.references :harvest, foreign_key: true
      t.string :type
      t.integer :quantity
      t.string :measurement_unit

      t.timestamps
    end
  end
end
