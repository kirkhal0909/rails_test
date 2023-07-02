require 'rails_helper'

RSpec.describe 'UsdRates', type: :request do
  before do
    allow_any_instance_of(Clients::Cbr).to receive(:exchange_rates).and_return(
      JSON.parse(file_fixture('apis/clients/cbr/exchange_rates.json').read)
    )
    CACHE.clear
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /get' do
    it 'returns http success' do
      get '/usd_rate/get'

      expect(response).to have_http_status(:success)
      expect(response.body).to eq({ usd_rate: 87.0341 }.to_json)
    end
  end
end
