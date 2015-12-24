require 'rubygems'
require 'simple-rss'
require 'open-uri'
module Crawl
  class Prestige
    attr_accessor :query
    def initialize(query)
      @query = query
    end

    def result(base_price)
      return if crawl_data.items.blank?
      (base_price + (crawl_data.items.map(&:pubDate).try(:count) || 0))
    end

    def crawl_data
      @crawl_data ||= SimpleRSS.parse open('http://www.yourlocalguardian.co.uk/sport/rugby/rss')
    end
  end
end
