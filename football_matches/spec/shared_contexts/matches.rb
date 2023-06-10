shared_context 'matches' do
  let(:first_match) { FactoryBot.create(:match, :with_zero_metrics) }
  let(:team1) { first_match.team1 }
  let(:team2) { first_match.team2 }
  let!(:matches) { FactoryBot.create_list(:match, 6, :with_zero_metrics, team1: team1, team2: team2) }
  let(:five_players) { team1.players.sample(5) }
end
