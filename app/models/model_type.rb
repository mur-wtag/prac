class ModelType < ActiveRecord::Base
  belongs_to :model, dependent: :destroy
end
