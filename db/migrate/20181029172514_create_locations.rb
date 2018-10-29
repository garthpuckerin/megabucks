class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :match_day
      t.timestamps
    end
  end
end
