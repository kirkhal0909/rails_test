require 'rails_helper'

RSpec.describe Interactors::Cbr::Steps::ReadCacheUsd do
  describe '#call' do
    before { CACHE.fetch(CACHE_KEYS[:usd_rate], force: true) { usd_rate } }
    let(:usd_rate) { 95 }

    context 'not use cache' do
      context 'cache clear' do
        before { CACHE.clear }

        it { expect(described_class.call.usd_rate).to eq(nil) }
      end

      context 'force == true' do
        it { expect(described_class.call(force: true).usd_rate).to eq(nil) }
      end
    end

    context 'use cache' do
      it { expect(described_class.call.usd_rate).to eq(usd_rate) }
    end
  end
end
