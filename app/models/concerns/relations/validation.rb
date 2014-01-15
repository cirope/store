module Relations::Validation
  extend ActiveSupport::Concern

  included do
    validates :organization_id, presence: true, uniqueness: { scope: :user_id }
  end
end
