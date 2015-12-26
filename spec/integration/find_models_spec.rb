require 'spec_helper'

RSpec.describe 'Find models with slug' do
  let(:organization) { FactoryGirl.create(:organization, pricing_policy: 3) }
  let(:model) { FactoryGirl.create(:model, organization_id: organization.id) }
  let(:model_type) { FactoryGirl.create(:model_type, model_id: model.id) }
  let(:model_slug) { model.model_slug }
  let(:expected_results) do
    [{"name"=>"MyString", "model_types"=>[{"name"=>"MyString", "base_price"=>1.5, "total_price"=>51.5}]}]
  end

  let(:response_json) { JSON.parse response.body }

  before do
    model_type
  end

  describe 'GET request' do
    it 'should find all model matched with this slug' do
      VCR.use_cassette 'integration/get/results.yml' do
        auth_request :get, "/api/models/#{model_slug}/model_types"
        expect(response.status).to eq(200)
        expect(response_json).to eq(expected_results)
      end
    end
  end
end
