class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.float :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
end
