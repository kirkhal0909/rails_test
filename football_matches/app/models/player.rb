class Player < ApplicationRecord
  belongs_to :team
  has_many :matches, Matches.lambda

  def self.top_five_by(factor)
    ids = Match.unscope(:order).select(:player_id)
               .joins(:player_metrics)
               .where("factors -> ? = 'true'", factor)
               .group(:player_id)
               .order(:player_id)
               .limit(5)
               .count.keys

    Player.where(id: ids)
  end
end
