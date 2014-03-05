module Books::Validation
  extend ActiveSupport::Concern

  included do
    validates :kind, :flow, presence: true, length: { maximum: 255 }
    validates :last_used_number, numericality: { only_integer: true }
    validates :flow, inclusion: { in: %w{income outcome} }

    validate :accepted_kind
  end

  private

    def accepted_kind
      errors.add :kind, :inclusion unless valid_kinds.include?(kind)
    end
end
