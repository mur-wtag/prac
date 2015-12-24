require 'spec_helper'

RSpec.describe 'Find models with slug' do
  let(:model_slug) { 'bmw' }
  describe 'GET request' do
    it 'should find all model matched with this slug' do
      auth_request :get, "/api/models/#{model_slug}/model_types"
      expect(response.status).to eq(200)
      expect(response.body).to eq(200)
    end
  end
end
