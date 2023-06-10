require 'rails_helper'
require 'shared_contexts/matches'

RSpec.describe Player, type: :model do
  include_context 'matches'

  let(:player) { team1.players.first }

  describe 'associations' do
    it { should belong_to(:team).class_name('Team') }
    it { should have_many(:player_metrics).class_name('PlayerMetric') }
    it { expect(player.matches.class.name).to include('CollectionProxy') }
  end

  describe '.top_five_by' do
    include_context 'matches_top_five', false

    it 'top five order correct' do
      expect(Player.top_five_by(:run_ten_plus).count).to eq(counts)
    end
  end

  describe '#factor_present?' do
    context 'actual factor by 5 matches' do
      let(:actual_player_metric) { Match.first(5).last.player_metrics.sample }

      before do
        actual_player_metric.update(kilometers_run: 11)
      end

      it 'factor_present? == true' do
        expect(actual_player_metric.player.factor_present?(:run_ten_plus)).to eq(true)
      end

      context 'when added match with any teams' do
        before do
          FactoryBot.create(:match, :with_zero_metrics, time_start: Time.now + 1.year)
        end

        it 'factor_present? == true' do
          expect(actual_player_metric.player.factor_present?(:run_ten_plus)).to eq(true)
        end
      end
    end

    context 'not actual factor by 5 matches' do
      let(:not_actual_player_metric) { Match.first(6).last.player_metrics.sample }

      before do
        not_actual_player_metric.update(kilometers_run: 11)
      end

      it 'factor_present? == true' do
        expect(not_actual_player_metric.player.factor_present?(:run_ten_plus)).to eq(false)
      end
    end
  end
end
