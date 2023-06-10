shared_context 'matches' do
  let(:first_match) { FactoryBot.create(:match, :with_zero_metrics) }
  let(:team1) { first_match.team1 }
  let(:team2) { first_match.team2 }
  let!(:matches) { FactoryBot.create_list(:match, 6, :with_zero_metrics, team1: team1, team2: team2) }
end

shared_context 'matches_top_five' do |is_team|
  let(:top_players) { is_team ? five_players : five_players_any_teams }
  let(:five_players) { team1.players.sample(5) }
  let(:five_players_any_teams) { team1.players.sample(2) + team2.players.sample(3) }

  before do
    top_players.each_with_index do |player, index|
      player.player_metrics.first(6 - index).each { |player_metric| player_metric.update(kilometers_run: 11) }
    end
  end

  let(:counts) do
    count = 7
    top_players.each_with_object({}) { |player, results| results[player.id] = count -= 1 }
  end
end
