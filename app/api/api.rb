require 'doorkeeper/grape/helpers'

module API
  class Dispatch < Grape::API
    helpers Doorkeeper::Grape::Helpers

    PAGINATION_MAX_PER_PAGE     = 300
    PAGINATION_DEFAULT_PER_PAGE = 50

    include Grape::Kaminari

    version 'v1', using: :header, vendor: 'untitled'
    format :json

    #
    # Authentication
    #
    #
    before do
      doorkeeper_authorize!
    end

    #
    # Pagination
    #
    before do
      # grape-kaminari will always return a page header of the given per_page param
      # and not the really used (and maybe enforced) value
      if params[:per_page] && params[:per_page].to_i > PAGINATION_MAX_PER_PAGE
        params[:per_page] = PAGINATION_MAX_PER_PAGE
      end

      # grape-kaminari will not return a header with the default value if there was no
      # per_page param
      params[:per_page] ||= PAGINATION_DEFAULT_PER_PAGE
    end

    #
    # Ping? Pong!
    #
    desc 'Ping? Pong!'
    get :ping do
      { pong: Time.now }
    end

    #
    # Resources
    #
    mount API::Resources::Models
  end

  Base = Rack::Builder.new do
    use API::Logger
    run API::Dispatch
  end
end
