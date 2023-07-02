require 'rails_helper'

RSpec.describe 'Admins', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/admin'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /force_usd' do
    before { CACHE.fetch(CACHE_KEYS[:usd_rate], force: true) { 80 } }

    let(:usd_rate) { 99 }
    let(:expires_in) { (Time.zone.now + 181.minute).to_s }

    it 'returns http success' do
      post '/admin/force_usd', params: { usd_rate: usd_rate, expires_in: expires_in }

      expect(response).to have_http_status(:success)
      expect(response.body).to eq({ status: :ok }.to_json)
      expect(CACHE.fetch(CACHE_KEYS[:usd_rate])).to eq(usd_rate)
    end
  end
end
