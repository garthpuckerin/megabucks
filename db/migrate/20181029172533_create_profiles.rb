class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :handicap
      t.references :user
      t.references :location
      t.timestamps
    end
  end
end
