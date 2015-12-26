require 'spec_helper'

RSpec.describe ModelType, type: :model do
  context 'association' do
    xit { should belong_to(:model) }
    xit { should belong_to(:organization) }
  end
end
