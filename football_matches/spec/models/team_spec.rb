require 'rails_helper'
require 'shared_contexts/matches'

RSpec.describe Team, type: :model do
  include_context 'matches'

  describe 'associations' do
    it { should have_many(:players).class_name('Player') }
    it { expect(team1.matches.class.name).to include('CollectionProxy') }
  end

  describe '.top_five_players_by' do
    before do
      five_players.each_with_index do |player, index|
        player.player_metrics.first(6 - index).each { |player_metric| player_metric.update(kilometers_run: 11) }
      end
    end

    let(:counts) do
      count = 7
      five_players.each_with_object({}) { |player, results| results[player.id] = count -= 1 }
    end

    it 'top five order correct' do
      expect(team1.top_five_players_by(:run_ten_plus).count).to eq(counts)
    end
  end
end
