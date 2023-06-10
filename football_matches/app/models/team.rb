class Team < ApplicationRecord
  has_many :players
  has_many :matches, Matches.lambda

  def top_five_players_by(factor)
    Player.top_five_by(factor, id)
  end
end
