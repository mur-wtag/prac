module Models
  class CarModel
    PRICING_POLICIES = {
      1 => ::Crawl::Flexible.new('a'),
      2 => ::Crawl::Fixed.new('status'),
      3 => ::Crawl::Prestige.new('pubData')
    }
    attr_accessor :models
    def initialize(query)
      @models = Model.where('model_slug ILIKE ?', "%#{query[:model_slug]}%")
    end

    def results
      models.map do |model|
        {
          name: model.name,
          model_types: map_model_types(model)
        }
      end.compact
    end

    def map_model_types(model)
      organization = model.organization
      pricing_policy = organization.pricing_policy
      model.model_types.map do |model_type|
        {
          name: model_type.name,
          base_price: model_type.base_price,
          total_price: PRICING_POLICIES[pricing_policy].result(model_type.base_price) || 0
        }
      end.compact
    end
  end
end
