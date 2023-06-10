class Player < ApplicationRecord
  belongs_to :team
  has_many :matches, Matches.lambda
  has_many :player_metrics

  def self.top_five_by(factor)
    Player.select('players.*')
          .joins(:player_metrics)
          .where("factors -> ? = 'true'", factor)
          .group(:id)
          .order(:id)
          .limit(5)
  end
end
