module Entities::TaxCondition
  extend ActiveSupport::Concern

  included do
    TAX_CONDITIONS = [
      'responsible', 'mono_tax', 'exempt', 'not_responsible', 'final_consumer'
    ]

    ISSUABLE_RECEIPTS = {
      responsible: ['A', 'B', 'X'],
      mono_tax: ['C', 'X'],
      exempt: [],
      not_responsible: [],
      final_consumer: []
    }.with_indifferent_access

    validates :tax_condition, inclusion: { in: TAX_CONDITIONS }
  end

  def issuable_receipts
    ISSUABLE_RECEIPTS.fetch tax_condition
  end
end
