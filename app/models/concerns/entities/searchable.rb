module Entities::Searchable
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { includes(:entity).order("#{Entity.table_name}.name") }
  end

  module ClassMethods
    def search query: nil, limit: false
      result = ordered

      if query.present?
        result = result.where "#{Entity.table_name}.name ILIKE ?", "%#{query.strip}%"
      end

      limit ? result.limit(10) : result
    end
  end
end
