class PurchaseItem < ActiveRecord::Base
  include Auditable
  include PurchaseItems::Validation

  belongs_to :item
  belongs_to :purchase
end
