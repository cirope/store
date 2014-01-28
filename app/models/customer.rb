class Customer < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Entities::Searchable
  include Invoiceable

  has_many :invoices, dependent: :destroy

  def to_s
    name
  end
end
