require 'spec_helper'

RSpec.describe Crawl::Flexible do
  context 'valid_input' do
    it_behaves_like 'a crawler class' do
      let(:fixed_external_response) do
        VCR.use_cassette 'crawl/flexible/data.yml' do
          instance.crawl_data
        end
      end
      let(:base_price) { 1123 }
      let(:input) { 'a' }
      let(:expected_result) { 1131 }
      let(:instance) { described_class.new(input) }
    end
  end
end
