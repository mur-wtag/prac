require 'spec_helper'

RSpec.describe API::Entities::Model do
  let(:organization) { FactoryGirl.create(:organization) }
  let(:model) { FactoryGirl.create(:model, organization_id: organization.id) }
  let(:model_type) { FactoryGirl.create(:model_type, model_id: model.id) }

  let(:model_entity) { API::Entities::Model.represent(model) }

  subject { JSON.parse(model_entity.to_json) }

  it 'matches the api specification' do
    expect(subject).
      to eq({"name"=>"MyString", "model_types"=>[]})
  end
end
