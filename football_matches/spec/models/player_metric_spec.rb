require 'rails_helper'

RSpec.describe PlayerMetric, type: :model do
  let(:match) { FactoryBot.create(:match, :with_zero_metrics) }
  let(:player_metric) { match.player_metrics.last }

  describe 'associations' do
    it { should belong_to(:player).class_name('Player') }
    it { should belong_to(:match).class_name('Match') }
  end

  describe '#create' do
    it 'when factors generated with callback' do
      expect(player_metric.factors.present?).to eq(true)
    end

    it 'all factors false' do
      expect(player_metric.factors.values.all? { |value| value == false }).to eq(true)
    end

    context 'duplicate metric' do
      let(:player_metric_dup) { player_metric.dup }
      before { player_metric_dup.save }

      it 'validation error on not uniq [:player, :match]' do
        expect(player_metric_dup.errors.messages[:player].present?).to eq(true)
      end
    end
  end

  describe '#save/#update' do
    context 'callback callback_update_factors' do
      before { player_metric.update(kilometers_run: 11) }

      it 'callback update factors' do
        expect(player_metric.factors['run_ten_plus']).to eq(true)
      end
    end
  end
end
