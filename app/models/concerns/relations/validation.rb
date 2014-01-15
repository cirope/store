module Relations::Validation
  extend ActiveSupport::Concern

  included do
    validates :account, presence: true
    validates :account_id, uniqueness: { scope: :user_id }
  end
end
