module Invoiceable
  extend ActiveSupport::Concern

  included do
    delegate :tax_id,        :tax_id=,
             :tax_situation, :tax_situation=,
             :name,          :name=,
             :address,       :address=,
             :city,          :city=,
             :city_id,       :city_id=,
             to: :entity

    validates :entity, presence: true

    has_one :entity, as: :invoiceable, validate: true, dependent: :destroy

    accepts_nested_attributes_for :entity
  end

  def entity
    super || build_entity
  end
end
