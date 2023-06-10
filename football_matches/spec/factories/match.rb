FactoryBot.define do
  factory :match do
    time_start { Time.now }
    team1 { create :team }
    team2 { create :team }
    player_metrics do
      players = team1.players + team2.players
      build_list :player_metric, players.length do |player_metric, index|
        player_metric.player = players[index]
      end
    end
  end
end
