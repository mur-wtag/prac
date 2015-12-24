require 'spec_helper'

describe API::Resources::Models do
  let(:organization) { FactoryGirl.create(:organization) }
  let(:model) { FactoryGirl.create(:model, organization_id: organization.id) }
  let(:model_type) { FactoryGirl.create(:model_type, model_id: model.id) }
  let(:model_slug) { model.model_slug }

  describe 'GET :model_slug/model_types' do
    let(:car_model_double) { instance_double(::Models::CarModel) }

    let(:valid_params) do
      {
        model_slug: model_slug
      }
    end

    let(:request_url) { "/api/models/#{model_slug}/model_types" }
    let(:response_json) { JSON.parse(response.body) }

    context 'valid url means valid model_slug' do
      it 'requires model_slug' do
        auth_request :get, request_url, valid_params.except(:model_slug)
        expect(response.status).to eq(200)
      end
    end

    context 'complete parameters' do
      before do
        allow(::Models::CarModel).to receive(:new).and_return(car_model_double)
        allow(car_model_double).to receive(:results).and_return({})
      end

      it 'calls the Select class' do
        expect(::Models::CarModel).to receive(:new).and_return(car_model_double)
        expect(car_model_double).to receive(:results).and_return({})
        auth_request :get, request_url, valid_params
      end
    end
  end

  describe 'POST :model_slug/model_types_price/:model_type_slug' do
    let(:model_type_slug) { model_type.model_type_slug }
    let(:base_price) { model_type.base_price }
    let(:request_url) { "/api/models/#{model_slug}/model_types_price/#{model_type_slug}" }
    let(:expected_response) do
      { name: nil, base_price: nil, total_price: 9.5 }
    end

    let(:valid_params) do
      {
        base_price: base_price,
        model_slug: model_slug,
        model_type_slug: model_type_slug
      }
    end

    context 'a valid request' do
      it 'model_type creates succesfully' do
        VCR.use_cassette 'model/model_type/create/successful' do
          auth_request :post, request_url, valid_params
          expect(response.status).to eq(201)
          expect(response.body).to eq(expected_response.to_json)
          expect(response.content_type).to eq('application/json')
        end
      end
    end
  end
end
