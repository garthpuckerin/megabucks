class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.date :match_date
      t.string :location
      t.string :format
      t.integer :player1
      t.integer :player2
      t.string :winner
      t.string :loser
      t.timestamps
    end
  end
end
