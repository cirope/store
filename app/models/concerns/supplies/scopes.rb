module Supplies::Scopes
  extend ActiveSupport::Concern

  included do
    scope :active, -> { where "#{table_name}.quantity > ?", 0 }
    scope :active_quantity, -> { active.sum "#{table_name}.quantity" }
  end
end
