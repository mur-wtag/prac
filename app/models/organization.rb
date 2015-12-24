class Organization < ActiveRecord::Base
  has_many :models, dependent: :destroy

  PRICING_POLICIES = {
    1 => 'Flexible',
    2 => 'Fixed',
    3 => 'Prestige'
  }

  def pricing_policy
    TYPES[pricing_policy]
  end
end
