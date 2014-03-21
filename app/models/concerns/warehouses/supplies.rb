module Warehouses::Supplies
  extend ActiveSupport::Concern

  included do
    before_destroy :check_supplies

    has_many :supplies, dependent: :destroy
    accepts_nested_attributes_for :supplies, allow_destroy: true, reject_if: :all_blank
  end

  private

    def check_supplies
      unless supplies.active_quantity == 0
        errors.add :base, :with_stock; false
      end
    end
end
