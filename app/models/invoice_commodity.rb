class InvoiceCommodity < ActiveRecord::Base
  include Auditable
  include InvoiceCommodities::Validation

  belongs_to :commodity
  belongs_to :invoice
end
