module ReceiptItems::Validation
  extend ActiveSupport::Concern

  included do
    validates :item, :quantity, presence: true
    validates :quantity, numericality: { greater_than: 0 }
  end
end
