module Supplies::Validation
  extend ActiveSupport::Concern

  included do
    validates :quantity, :commodity, presence: true
  end
end
