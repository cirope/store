module Bounds::Validation
  extend ActiveSupport::Concern

  included do
    validates :user, presence: true
    validates :duration, numericality: {
      only_integer: true, greater_than_or_equal_to: 0, less_than: 2_147_483_648
    }, allow_blank: true
  end
end
