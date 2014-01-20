module Books::Validation
  extend ActiveSupport::Concern

  included do
    validates :kind, presence: true, length: { maximum: 255 }
    validates :last_used_number, numericality: { only_integer: true }
  end
end
