class Book < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Books::Flow
  include Books::KindClass
  include Books::NextNumber
  include Books::Organization
  include Books::Validation

  has_many :invoices, dependent: :destroy
  has_many :receipts, dependent: :destroy

  def to_s
    kind
  end
end
