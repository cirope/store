class Customer < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Customers::Birthdays
  include Customers::DestroyValidation
  include Customers::LastReceipt
  include Customers::Validation
  include Entities::Searchable
  include Invoiceable

  has_many :invoices, dependent: :destroy
  has_many :receipts, dependent: :destroy

  def to_s
    name
  end
end
