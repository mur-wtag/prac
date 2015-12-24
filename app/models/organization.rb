class Organization < ActiveRecord::Base
  has_many :models, dependent: :destroy
end
