module Models
  class CarModel
    attr_accessor :model
    def initialize(query)
      @model = Model.where('model_slug ILIKE ?', "%#{query[:model_slug]}%")
    end

    def results
      model
    end
  end
end
