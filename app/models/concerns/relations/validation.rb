module Relations::Validation
  extend ActiveSupport::Concern

  included do
    validates :organization, presence: true
    validates :organization_id, uniqueness: { scope: :user_id }
  end
end
