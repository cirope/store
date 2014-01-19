module Entities::TaxCondition
  extend ActiveSupport::Concern

  included do
    TAX_CONDITIONS = [
      'responsible', 'mono_tax', 'exempt', 'not_responsible', 'final_consumer'
    ]

    validates :tax_condition, inclusion: { in: TAX_CONDITIONS }
  end
end
