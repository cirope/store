module Customers::Validation
  extend ActiveSupport::Concern

  included do
    validates :tax_id, :name, presence: true
    validates :tax_id, :name,
      length:     { maximum: 255 },
      uniqueness: { case_sensitive: false, scope: :account_id }
  end
end
