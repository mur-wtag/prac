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
        post ':model_slug/model_types_price/:model_type_slug' do
          # models = ::Models::CarModel.new(params[:model_slug]).results
          model = Model.find_by_model_slug params[:model_slug]
          attributes = {
            name: 'Not Provided',
            base_price: params[:base_price],
            model_type_slug: params[:model_type_slug],
            model_type_code: 'code_not_found'
          }
          model_type = {}
          model_type = model.model_types.create attributes unless model.blank?
          begin
            present models, model_type, with: API::Entities::ModelType
          rescue Exception => error
            Rails.logger.error "#{error}"
          status :bad_gateway
          { errors: 'Something went wrong' }
          end
        end
      end
    end
  end
end

