module CommodityClassification
  extend ActiveSupport::Concern

  included do
    default_scope -> { joins(:commodity) }

    delegate :name, :name=, :price, :price=, :account_id, to: :commodity
    before_destroy :add_destroy_error, unless: -> { commodity.allow_destroy? }

    has_one :commodity, as: :classification, dependent: :destroy
    accepts_nested_attributes_for :commodity
  end

  private

    def add_destroy_error
      errors.add :base, 'Commodity can not be destroyed'
    end
end
