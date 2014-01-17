class Invoice < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Invoices::Validation

  belongs_to :customer
  belongs_to :organization

  def to_s
    number.to_s
  end
end
