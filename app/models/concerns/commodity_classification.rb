module CommodityClassification
  extend ActiveSupport::Concern

  included do
    delegate :name, :name=, :price, :price=, :account_id, to: :commodity

    has_one :commodity, as: :classification, dependent: :destroy
    accepts_nested_attributes_for :commodity
  end
end
