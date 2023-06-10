require 'rails_helper'
require 'shared_contexts/matches'

RSpec.describe Team, type: :model do
  include_context 'matches'

  describe 'associations' do
    it { should have_many(:players).class_name('Player') }
    it { expect(team1.matches.class.name).to include('CollectionProxy') }
  end

  describe '.top_five_players_by' do
    include_context 'matches_top_five', true

    it 'top five order correct' do
      expect(team1.top_five_players_by(:run_ten_plus).count).to eq(counts)
    end
  end
end
