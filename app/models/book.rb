class Book < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Auditable
  include Books::NextNumber
  include Books::Validation

  strip_fields :kind

  include Books::Organization
  has_many :invoices, dependent: :destroy
  has_many :receipts, dependent: :destroy

  def to_s
    kind
  end
end
