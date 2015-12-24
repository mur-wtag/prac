class Model < ActiveRecord::Base
  belongs_to :organization
  has_many :model_types, dependent: :destroy

  TYPES = {
    1 => 'Show Room',
    2 => 'Service',
    3 => 'Dealer'
  }
end
