class InvoiceItem < ActiveRecord::Base
  include Auditable
  include InvoiceItems::Validation

  belongs_to :item
  belongs_to :invoice
end
