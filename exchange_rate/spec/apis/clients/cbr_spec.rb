require 'rails_helper'

RSpec.describe Clients::BaseClient do
  subject(:client) { described_class.new }

  describe '#exchange_rates' do
    before { allow(described_class).to receive(:get).with(full_link).and_return(response) }

    let(:link) { 'https://www.cbr.ru/scripts/XML_daily.asp' }
    let(:params) { { date_req: '30/06/2023' } }

    let(:full_link) { "https://www.cbr.ru/scripts/XML_daily.asp?#{URI.encode_www_form(params)}" }
    let(:response) { file_fixture('apis/clients/cbr/exchange_rates.json').read }

    it 'return exchange_rates' do
      expect(client.get(link, params)).to eq(response)
    end
  end
end
