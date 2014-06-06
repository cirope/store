module Customers::Birthdays
  extend ActiveSupport::Concern

  included do
    acts_as_birthday :birth
    scope :order_by_birth, -> { order 'to_char("birth", \'MMDD\')' }
  end
end
