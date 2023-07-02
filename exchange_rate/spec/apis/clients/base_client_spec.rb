require 'rails_helper'

RSpec.describe Clients::BaseClient do
  subject(:client) { described_class.new }

  describe '#get' do
    before { allow(described_class).to receive(:get) { |argument| argument } }

    let(:link) { 'https://some-url.ru' }
    let(:params) { {} }

    let(:full_link) { link }

    it { expect(client.get(link, params)).to eq(full_link) }

    context 'with params' do
      let(:params) { { param1: '09', param2: '10' } }
      let(:full_link) { "#{link}?param1=09&param2=10" }

      it { expect(client.get(link, params)).to eq(full_link) }
    end
  end
end
