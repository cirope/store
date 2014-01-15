module Users::Scopes
  extend ActiveSupport::Concern

  included do
    scope :current, -> {
      joins(:accounts).where accounts: { id: Account.current_id }
    }
  end

  module ClassMethods
    def by_auth_token token
      where(auth_token: token).includes(:accounts).take
    end
  end
end
