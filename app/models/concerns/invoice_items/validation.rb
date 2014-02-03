module InvoiceItems::Validation
  extend ActiveSupport::Concern

  included do
    validates :item, :quantity, :price, presence: true
    validates :quantity, numericality: { greater_than: 0, less_than: 99_999_999.99 }
    validates :price, numericality: { greater_than_or_equal_to: 0, less_than: 9_999_999_999_999.99 }
  end
end
