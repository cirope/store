module Uses::Validation
  extend ActiveSupport::Concern

  included do
    validates :item, :quantity, presence: true
    validates :quantity, numericality: { greater_than: 0, less_than: 99_999_999.99 }
  end
end
