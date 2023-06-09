class Team < ApplicationRecord
  has_many :players

  def matches
    Match.where('team1_id = ? or team2_id = ?', id, id)
  end
end
