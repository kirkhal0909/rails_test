require 'rails_helper'

RSpec.describe Interactors::Cbr::Steps::BroadcastUsd do
  describe '#call' do
    before do
      allow(ActualUsdRateChannel).to receive(:broadcast_to).with(CABLE_CHANNELS[:usd_rate], { usd_rate: usd_rate })
                                                           .and_return('broadcasted')
    end
    let(:usd_rate) { 92 }

    it do
      expect { described_class.call(usd_rate: usd_rate) }.not_to raise_error
    end
  end
end
