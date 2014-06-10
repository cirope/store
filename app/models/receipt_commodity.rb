class ReceiptCommodity < ActiveRecord::Base
  include Auditable
  include ReceiptCommodities::Bounds
  include ReceiptCommodities::Validation

  delegate :price, to: :commodity, allow_nil: true

  belongs_to :commodity
  belongs_to :receipt
end
