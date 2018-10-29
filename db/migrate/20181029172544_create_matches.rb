class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.date :match_date
      t.references :location
      t.string :format
      t.references :user
      t.references :user
      t.string :winner
      t.string :loser
      t.timestamps
    end
  end
end
