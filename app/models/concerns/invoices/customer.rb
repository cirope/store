module Invoices::Customer
  extend ActiveSupport::Concern

  included do
    delegate :entity, to: :customer, prefix: true

    belongs_to :customer
  end
end
