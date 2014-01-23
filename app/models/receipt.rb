class Receipt < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Books::Numerable
  include Receipts::Validation

  belongs_to :customer

  def to_s
    number.to_s
  end
end
