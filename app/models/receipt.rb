class Receipt < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Books::Numerable
  include CustomerScoped
  include Receipts::Customer
  include Receipts::DefaultValues
  include Receipts::Scopes
  include Receipts::Validation

  has_many :receipt_commodities, dependent: :destroy
  accepts_nested_attributes_for :receipt_commodities, allow_destroy: true, reject_if: :all_blank

  def to_s
    number.to_s
  end

  def total
    # TODO: ensure BigDecimals instead of floats
    receipt_commodities.to_a.sum { |rc| rc.quantity.to_f * rc.price.to_f }
  end
end
