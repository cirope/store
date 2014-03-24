module Items::Supplies
  extend ActiveSupport::Concern

  included do
    has_many :supplies, -> { active }, autosave: true, dependent: :destroy
  end

  def use count: 0, warehouse: nil
    supplies.any? do |supply|
      if supply.warehouse_id == warehouse.id
        supply.use count

        count = supply.remaining_from_last_use
      end

      count == 0
    end
  end
end
