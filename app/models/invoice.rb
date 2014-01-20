class Invoice < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Invoices::Validation

  belongs_to :customer
  belongs_to :book

  def to_s
    number.to_s
  end
end
