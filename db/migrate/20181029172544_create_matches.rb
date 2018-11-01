class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.date :match_date
      t.string :match_format
      t.string :match_type
      t.integer :player1
      t.integer :player2
      t.string :p1_result
      t.string :p2_result
      t.references :location, foreign_key: true
      t.timestamps
    end
  end
end
