class PurchaseCommodity < ActiveRecord::Base
  include Auditable
  include PurchaseCommodities::Validation

  belongs_to :commodity
  belongs_to :purchase
end
