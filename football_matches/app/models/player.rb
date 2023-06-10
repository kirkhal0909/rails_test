class Player < ApplicationRecord
  belongs_to :team
  has_many :matches, Matches.lambda
  has_many :player_metrics

  def self.top_five_by(factor, team_id = nil)
    Player.select('players.*')
          .joins(:player_metrics)
          .where("factors -> ? = 'true'", factor)
          .where(team_id ? 'team_id = ?' : 'true', team_id)
          .group(:id)
          .order(:id)
          .limit(5)
  end

  def last_matches(limit = 5)
    matches.limit(limit).select(:id)
  end

  def factor_present?(factor)
    matches.joins(:player_metrics)
           .where("factors -> ? = 'true'", factor)
           .where('player_metrics.player_id = ?', id)
           .where("matches.id in (#{ActiveRecord::Base.sanitize_sql(last_matches.to_sql)})")
           .present?
  end
end
