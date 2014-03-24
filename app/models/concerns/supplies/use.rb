module Supplies::Use
  extend ActiveSupport::Concern

  included do
    attr_accessor :remaining_from_last_use
  end

  def use count
    if quantity >= count
      self.quantity -= count
      self.remaining_from_last_use = 0

      true
    else
      self.quantity = 0
      self.remaining_from_last_use = count - quantity_was

      false
    end
  end
end
