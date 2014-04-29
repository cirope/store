module Books::Scopes
  extend ActiveSupport::Concern

  included do
    scope :income,  -> { where flow: 'income' }
    scope :outcome, -> { where flow: 'outcome' }
  end

  def sheets_count_by_customer customer
    sheets.where(customer_id: customer.id).count
  end
end
