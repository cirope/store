module Commodities::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order("#{table_name}.name") }
  end

  module ClassMethods
    def search query: nil, limit: false
      result = Commodity.ordered

      if query.present?
        result = result.where "#{table_name}.name ILIKE ?", "%#{query.strip}%"
      end

      limit ? result.limit(10) : result
    end

    def with_receipts_between start, finish
      joins(:receipt_commodities).references(:receipt_commodities).
        where receipt_commodities: {
          created_at: start.at_beginning_of_day..finish.at_end_of_day
        }
    end

    def receipt_sales
      joins(:receipt_commodities).references(:receipt_commodities).
        group('commodities.id, commodities.name').
        order('sum_receipt_commodities_quantity DESC').
        sum('receipt_commodities.quantity')
    end
  end
end
