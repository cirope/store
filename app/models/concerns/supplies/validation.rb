module Supplies::Validation
  extend ActiveSupport::Concern

  included do
    validates :quantity, :item, presence: true
  end
end
