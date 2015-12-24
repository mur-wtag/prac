module API
  module Entities
    class ModelType < API::Entities::Base
      expose :name
      expose :base_price
    end
  end
end
