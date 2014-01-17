module Invoices::Validation
  extend ActiveSupport::Concern

  included do
    validates :number, presence: true, uniqueness: { scope: :organization_id }
  end
end
