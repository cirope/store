module Phones::Validation
  extend ActiveSupport::Concern

  included do
    validates :phone, presence: true, length: { maximum: 255 }
  end
end
