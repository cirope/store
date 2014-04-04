class ReceiptCommodity < ActiveRecord::Base
  include Auditable
  include ReceiptCommodities::Validation

  belongs_to :commodity
  belongs_to :receipt
end
