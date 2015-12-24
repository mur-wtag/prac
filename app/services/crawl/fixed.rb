module Crawl
  class Fixed
    attr_accessor :query
    def initialize(query)
      @query = query
    end

    def result(base_price)
      base_price + ((crawl_data.to_s.count(query) / 100) || 0)
    end

    def crawl_data
      crawler = Cobweb.new(:follow_redirects => false)
      crawler.get('https://developer.github.com/v3')
    end
  end
end
