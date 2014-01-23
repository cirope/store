class ReceiptItem < ActiveRecord::Base
  include Auditable
  include ReceiptItems::Validation

  belongs_to :item
  belongs_to :receipt
end
