require 'spec_helper'

RSpec.describe Model, type: :model do
  context 'association' do
    xit { should belong_to(:organization) }
    xit { should have_many(:model_type) }
  end
end
