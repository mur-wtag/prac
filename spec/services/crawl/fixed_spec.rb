require 'spec_helper'

RSpec.describe Crawl::Fixed do
  context 'valid_input' do
    it_behaves_like 'a crawler class' do
      let(:fixed_external_response) do
        VCR.use_cassette 'crawl/fixed/data.yml' do
          instance.crawl_data
        end
      end
      let(:base_price) { 1123 }
      let(:input) { 'status' }
      let(:expected_result) { 1124 }
      let(:instance) { described_class.new(input) }
    end
  end
end
