module Invoices::Commodities
  extend ActiveSupport::Concern

  included do
    has_many :invoice_commodities, dependent: :destroy
    accepts_nested_attributes_for :invoice_commodities, allow_destroy: true, reject_if: :all_blank
  end

  def total
    # TODO: ensure BigDecimals instead of floats
    invoice_commodities.to_a.sum { |rc| rc.quantity.to_f * rc.price.to_f }
  end
end
