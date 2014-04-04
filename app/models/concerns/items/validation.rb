module Items::Validation
  extend ActiveSupport::Concern

  included do
    validate :code_uniqueness
    validates :code, :unit, presence: true, length: { maximum: 255 }
  end

  private

    def code_uniqueness
      scope = self.class.includes :commodity
      conditions = { code: code, commodities: { account_id: account_id } }

      if scope.where(conditions).exists?
        errors.add :code, :taken
      end
    end
end
