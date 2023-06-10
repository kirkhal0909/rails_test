require 'rails_helper'

RSpec.describe Match, type: :model do
  let(:match) { FactoryBot.create(:match) }

  describe 'associations' do
    it { should belong_to(:team1).class_name('Team') }
    it { should belong_to(:team2).class_name('Team') }
    it { should have_many(:player_metrics).class_name('PlayerMetric') }
  end

  describe 'FactoryBot.create' do
    it 'match created' do
      expect(match).to be_a(Match)
    end
  end

  describe 'scope' do
    before do
      FactoryBot.create(:match, time_start: Time.now)
      FactoryBot.create(:match, time_start: Time.now - 10.days)
      FactoryBot.create(:match, time_start: Time.now - 5.days)
    end

    let(:time_starts) { Match.all.pluck(:time_start) }

    it 'matches sorted by time_start' do
      expect(time_starts).to eq(time_starts.sort.reverse)
    end
  end

  describe '#update' do
    context 'uniqeness teams' do
      before do
        match.update(team1_id: match.team2_id)
      end

      it 'validation error' do
        expect(match.errors.messages[:team1_id]).to eq(['teams must be unique'])
      end
    end
  end
end
