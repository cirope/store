module Invoices::Validation
  extend ActiveSupport::Concern

  included do
    validates :number, presence: true, uniqueness: { scope: :book_id }
  end
end
