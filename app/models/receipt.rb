class Receipt < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Books::Numerable
  include Receipts::Customer
  include Receipts::Validation

  has_many :receipt_items, dependent: :destroy
  accepts_nested_attributes_for :receipt_items, allow_destroy: true, reject_if: :all_blank

  def to_s
    number.to_s
  end
end
