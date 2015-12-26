require 'spec_helper'

RSpec.describe API::Entities::ModelType do
  let(:organization) { FactoryGirl.create(:organization) }
  let(:model) { FactoryGirl.create(:model, organization_id: organization.id) }
  let(:model_type) { FactoryGirl.create(:model_type, model_id: model.id) }

  let(:model_type_entity) { API::Entities::ModelType.represent(model_type.attributes.merge(total_price: 100)) }

  subject { JSON.parse(model_type_entity.to_json) }

  it 'matches the api specification' do
    expect(subject).
        to eq({"name"=>nil, "base_price"=>nil, "total_price"=>100})
  end
end
