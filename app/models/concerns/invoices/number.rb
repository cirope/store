module Invoices::Number
  extend ActiveSupport::Concern

  included do
    attr_readonly :number

    before_validation :assign_number, on: :create
  end

  def assign_number
    self.number = book.next_number
  end
end
