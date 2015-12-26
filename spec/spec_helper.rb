ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'factory_girl_rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'vcr'
VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.hook_into :webmock
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.preserve_exact_body_bytes { false }
  config.default_cassette_options = {
    record: ENV['VCR_RECORD'] ? :all : :once,
    re_record_interval: 20.years,
    match_requests_on: [:method, :uri, :body],
  }
end
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

require 'shoulda/matchers'

WebMock.disable_net_connect!(allow_localhost: true)
Dir['./spec/support/**/*.rb'].sort.each { |file| require file }

RSpec.configure do |config|
  config.include AuthHelper

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include RSpec::Rails::RequestExampleGroup,
                 type: :request,
                 file_path: %r(spec/api)
  config.include RSpec::Rails::RequestExampleGroup,
                 type: :request,
                 file_path: %r(spec/integration)
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
