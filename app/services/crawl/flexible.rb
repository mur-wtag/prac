require 'wombat'
module Crawl
  class Flexible
    attr_accessor :query
    def initialize(query)
      @query = query
    end

    def result
      crawl_data
    end

    def crawl_data
      @crawl_data ||= Wombat.crawl do
        base_url 'http://reuters.com'
        path '/'

        links do
          explore xpath: '//*[@class="wrapper"]/div[1]/div[1]/div[2]/ul/li[1]/a' do |e|
            e.gsub(/Explore/, query)
          end
        end
      end
    end
  end
end
