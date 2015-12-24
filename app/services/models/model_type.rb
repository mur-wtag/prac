module Models
  class ModelType
    attr_accessor :model
    def initialize(model)
      @model = model
    end

    def results
      model.fetch(:model_types)
    end
  end
end
