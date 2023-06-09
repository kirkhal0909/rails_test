class Match < ApplicationRecord
  default_scope { order(time_start: :desc) }

  belongs_to :team1, class_name: 'Team'
  belongs_to :team2, class_name: 'Team'
  has_many :player_metrics
end
