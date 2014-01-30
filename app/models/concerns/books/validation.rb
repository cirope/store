module Books::Validation
  extend ActiveSupport::Concern

  included do
    validates :kind, presence: true, length: { maximum: 255 }
    validates :last_used_number, numericality: { only_integer: true }

    validate :accepted_kind
  end

  private

    def accepted_kind
      unless organization.issuable_receipts.include?(kind)
        errors.add :kind, :inclusion
      end
    end
end
