module Invoiceable
  extend ActiveSupport::Concern

  included do
    delegate :tax_id,        :tax_id=,
             :tax_condition, :tax_condition=,
             :name,          :name=,
             :email,         :email=,
             :address,       :address=,
             :city,          :city=,
             :city_id,       :city_id=,
             :issuable_receipts,
             to: :entity

    validates :entity, presence: true

    has_one :entity, as: :invoiceable, validate: true, dependent: :destroy

    accepts_nested_attributes_for :entity
  end

  def entity
    super || build_entity
  end
end
