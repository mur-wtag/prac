require 'spec_helper'

RSpec.describe Models::CarModel do
  let(:organization) { FactoryGirl.create(:organization, pricing_policy: 3) }
  let(:model) { FactoryGirl.create(:model, organization_id: organization.id) }
  let(:model_type) { FactoryGirl.create(:model_type, model_id: model.id) }
  let(:model_slug) { model.model_slug }
  let(:query_params) do
    {
        model_slug: model_slug
    }
  end

  let(:expected_result) do
    [{:name=>"MyString", :model_types=>[{:name=>"MyString", :base_price=>1.5, :total_price=>51.5}]}, {:name=>"MyString", :model_types=>[{:name=>"MyString", :base_price=>1.5, :total_price=>51.5}]}]
  end

  before do
    model_type
  end
  let(:instance) { Models::CarModel.new(query_params) }

  it 'should a return an CarModel object with given params and set it @models instance variable' do
    expect(instance.instance_variable_get(:@models).first).to be_instance_of(Model)
  end

  describe '#results' do
    context 'returns expected results' do
      it 'should return mapped models' do
        VCR.use_cassette 'car_model/results.yml' do
          expect(instance.results).to eq(expected_result)
        end
      end
    end
  end

  describe '#map_model_types(model)' do
    context 'returns expected result' do
      let(:expected_results) do
        [{:name=>"MyString", :base_price=>1.5, :total_price=>51.5}]
      end
      it 'should return mapped models' do
        VCR.use_cassette 'car_model/map_model_types_results.yml' do
          expect(instance.map_model_types(model)).to eq(expected_results)
        end
      end
    end
  end
end
