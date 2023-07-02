require 'rails_helper'

RSpec.describe Interactors::Cbr::Steps::FetchUsd do
  describe '#call' do
    before { allow_any_instance_of(Clients::Cbr).to receive(:exchange_rates).and_return(response) }

    context 'valid response' do
      let(:response) { JSON.parse(file_fixture('apis/clients/cbr/exchange_rates.json').read) }
      it { expect(described_class.call.usd_rate).to eq(87.0341) }
    end

    context 'empty json' do
      let(:response) { {} }
      it { expect(described_class.call.errors.present?).to eq(true) }
    end
  end
end
