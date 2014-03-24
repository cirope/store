module Supplies::Scopes
  extend ActiveSupport::Concern

  included do
    scope :active, -> { where "#{table_name}.quantity > ?", 0 }
    scope :active_quantity, -> { active.sum "#{table_name}.quantity" }
  end

  module ClassMethods
    def from warehouse
      where warehouse_id: warehouse.id
    end

    def active_quantity_from warehouse
      from(warehouse).active_quantity
    end
  end
end
