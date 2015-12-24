module API
  module Entities
    class Model < API::Entities::Base
      expose :name
      expose :model_types, using: API::Entities::ModelType
    end
  end
end
