class Receipt < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Books::Numerable
  include CustomerScoped
  include Receipts::Commodities
  include Receipts::Customer
  include Receipts::DefaultValues
  include Receipts::Scopes
  include Receipts::Validation

  has_many :feedbacks, as: :owner, dependent: :destroy

  def to_s
    number.to_s
  end
end
