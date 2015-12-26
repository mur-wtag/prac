RSpec.shared_examples 'a crawler class' do
  describe '#result' do
    subject { instance.result(base_price) }
    it { is_expected.to eq(expected_result) }
  end

  describe '#crawl_data' do
    subject { instance.crawl_data }
    it { is_expected.to eq(fixed_external_response) }
  end
end
