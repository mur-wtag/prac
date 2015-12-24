module API
  module Resources
    class Models < Grape::API

      namespace :models do
        desc 'Get all model types'
        params do
          requires :model_slug,
                   type: String,
                   desc: 'Model Slug'
        end
        get ':model_slug/model_types' do
          query_params = {
            model_slug: params[:model_slug]
          }
          models = ::Models::CarModel.new(query_params).results
          present models, with: API::Entities::Model
        end

        desc 'Create Model type'
        params do
          requires :base_price,
                   type: Float,
                   desc: 'Base Price'
          requires :model_slug,
                   type: String,
                   desc: 'Model Slug'
          requires :model_type_slug,
                   type: String,
                   desc: 'Model Slug Type'
        end
        post ':model_slug/model_types' do

        end
      end
    end
  end
end

