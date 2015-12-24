require 'wombat'
module Crawl
  class Fixed
    attr_accessor :query
    def initialize(query)
      @query = query
    end

    def result
      crawl_data
    end

    def crawl_data
      @crawl_data ||= Wombat.crawl do
        base_url 'https://developer.github.com'
        path '/v3'

        links do
          explore xpath: '//*[@class="http-redirects"]' do |e|
            e.gsub(/Explore/, query)
          end
        end
      end
    end
  end
end
