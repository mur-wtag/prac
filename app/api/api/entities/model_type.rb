module API
  module Entities
    class ModelType < API::Entities::Base
      expose :name
      expose :base_price
      expose :total_price
    end
  end
end
