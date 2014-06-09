module Customers::DestroyValidation
  extend ActiveSupport::Concern

  included do
    before_destroy :allow_destroy?
  end

  def allow_destroy?
    if receipts.any? || invoices.any?
      errors.add :base, 'Commodity can not be destroyed'

      false
    end
  end
end
