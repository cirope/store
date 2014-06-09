module Commodities::DestroyValidation
  extend ActiveSupport::Concern

  included do
    before_destroy :allow_destroy?
  end

  def allow_destroy?
    receipt_commodities.empty? && invoice_commodities.empty?
  end
end
