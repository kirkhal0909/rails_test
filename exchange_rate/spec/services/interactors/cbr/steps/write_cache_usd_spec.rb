require 'rails_helper'

RSpec.describe Interactors::Cbr::Steps::WriteCacheUsd do
  describe '#call' do
    before { CACHE.clear }

    context 'usd_rate.blank?' do
      it { expect(described_class.call.errors.present?).to eq(true) }
    end

    context 'usd_rate.present?' do
      before { described_class.call(usd_rate: usd_rate, **options) }
      let(:usd_rate) { 80 }
      let(:options) { {} }

      it 'writed to cache' do
        expect(CACHE.fetch(CACHE_KEYS[:usd_rate])).to eq(usd_rate)
      end

      context 'force == true' do
        let(:usd_rate) { 100 }

        context 'expires_in > now' do
          let(:options) { { force: true, expires_in: Time.zone.now + 1.day } }

          it 'writed to cache' do
            expect(CACHE.fetch(CACHE_KEYS[:usd_rate])).to eq(usd_rate)
          end
        end

        context 'expires_in < now' do
          let(:options) { { force: true, expires_in: Time.zone.now - 1.day } }

          it 'writed to cache and expired' do
            expect(CACHE.fetch(CACHE_KEYS[:usd_rate])).to eq(nil)
          end
        end
      end

      context 'force == false' do
        before do
          described_class.call(usd_rate: 80, force: true)
          described_class.call(usd_rate: usd_rate, **options)
        end

        let(:usd_rate) { 110 }
        let(:options) { { force: false } }

        it 'not writed to cache' do
          expect(CACHE.fetch(CACHE_KEYS[:usd_rate])).not_to eq(usd_rate)
        end
      end
    end
  end
end
