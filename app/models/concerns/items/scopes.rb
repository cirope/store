module Items::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order("#{Commodity.table_name}.name") }
  end

  module ClassMethods
    def search query: nil, limit: false
      result = ordered.includes(:commodity).references :commodities

      if query.present?
        result = result.where "#{Commodity.table_name}.name ILIKE ?", "%#{query.strip}%"
      end

      limit ? result.limit(10) : result
    end
  end
end
