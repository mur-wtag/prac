module API
  module Resources
    class Models < Grape::API

      namespace :models do
        desc 'Get all model types'
        params do

        end
        get ':model_slug/model_types' do

        end

        desc 'Create Model type'
        params do

        end
        post ':model_slug/model_types' do

        end
      end
    end
  end
end

