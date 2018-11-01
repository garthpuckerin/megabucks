class Match < ApplicationRecord
  belongs_to :location

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # Match.create! row
            # p row.to_hash
      match = {}
      
      row.to_hash.each  do |key, value|
        match[key.to_sym] = value
      end
      # p match

      Match.create!(
        match_date: match[:match_date],
      # p match_date:
        location_id: match[:location_id],
        match_format: match[:match_format],
        match_type: match[:match_type],
        player1: match[:player1],
        player2: match[:player2],
        p1_result: match[:p1_result],
        p2_result: match[:p2_result]
      )
    end
  end

  default_scope { order(:match_date) }

  # scope :p1wins, -> { where p1_result: "Won"}
  # scope :p2wins, -> { where p2_result: "Won"}
  # scope :p1losses, -> { where p2_result: "Loss"}
  # scope :p2losses, -> { where p2_result: "Loss"}
  # scope :p1losses2, -> { where p2_result: "Lost on Hill"}
  # scope :p2losses2, -> { where p2_result: "Lost on Hill"}
  
end
