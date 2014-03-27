module Invoices::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order "#{table_name}.id DESC" }
  end
end
