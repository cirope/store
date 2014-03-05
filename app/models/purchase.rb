class Purchase < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Books::Numerable
  include Purchases::Maker
  include Purchases::Provider
  include Purchases::Receiver
  include Purchases::Validation

  has_many :purchase_items, dependent: :destroy
  accepts_nested_attributes_for :purchase_items, allow_destroy: true, reject_if: :all_blank

  def to_s
    number.to_s
  end
end
