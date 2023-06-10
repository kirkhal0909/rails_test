require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:first_match) { FactoryBot.create(:match, :with_zero_metrics) }
  let(:team1) { first_match.team1 }
  let(:team2) { first_match.team2 }
  let!(:matches) { FactoryBot.create_list(:match, 6, :with_zero_metrics, team1: team1, team2: team2) }

  describe 'associations' do
    it { should have_many(:players).class_name('Player') }
    it { expect(team1.matches.class.name).to include('CollectionProxy') }
  end

  describe '.top_five_players_by' do
    let(:five_players) { team1.players.sample(5) }
    before do
      five_players.each_with_index do |player, index|
        player.player_metrics.first(6 - index).each { |player_metric| player_metric.update(kilometers_run: 11) }
      end
    end

    let(:counts) do
      count = 6
      five_players.each_with_object({}) { |player, results| results[player.id] = count; count -= 1 }
    end

    it 'top five order correct' do
      expect(team1.top_five_players_by(:run_ten_plus).count).to eq(counts)
    end
  end
end
