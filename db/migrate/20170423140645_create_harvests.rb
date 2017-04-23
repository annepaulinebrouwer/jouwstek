class CreateHarvests < ActiveRecord::Migration[5.0]
  def change
    create_table :harvests do |t|
      t.references :garden, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
