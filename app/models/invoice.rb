class Invoice < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Books::Numerable
  include CustomerScoped
  include Invoices::Commodities
  include Invoices::Customer
  include Invoices::DefaultValues
  include Invoices::Scopes
  include Invoices::Validation

  def to_s
    number.to_s
  end
end
