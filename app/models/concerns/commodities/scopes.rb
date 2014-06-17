module Commodities::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order("#{table_name}.name") }
  end

  module ClassMethods
    def search query: nil, limit: false
      result = ordered

      if query.present?
        result = result.where "#{table_name}.name ILIKE ?", "%#{query.strip}%"
      end

      limit ? result.limit(10) : result
    end

    def sales_report_by voucher, start: Time.zone.today, finish: Time.zone.today
      sold_between_by(voucher, start, finish).
        group('commodities.id, commodities.name').
        order("sum_#{voucher}_commodities_quantity DESC").
        sum("#{voucher}_commodities.quantity")
    end

    private

      def sold_between_by voucher, start, finish
        relation = :"#{voucher}_commodities"

        joins(relation).references(relation).
          where(
            relation => {
              created_at: start.at_beginning_of_day..finish.at_end_of_day
            }
          )
      end
  end
end
