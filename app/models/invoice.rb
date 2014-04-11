class Invoice < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Books::Numerable
  include Invoices::Customer
  include Invoices::DefaultValues
  include Invoices::Scopes
  include Invoices::Validation

  has_many :invoice_items, dependent: :destroy
  accepts_nested_attributes_for :invoice_items, allow_destroy: true, reject_if: :all_blank

  def to_s
    number.to_s
  end
end
