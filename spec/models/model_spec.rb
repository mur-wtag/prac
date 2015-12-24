require 'spec_helper'

RSpec.describe Model, type: :model do
  it { should have_many :model_types }
end
