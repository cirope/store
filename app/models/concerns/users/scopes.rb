module Users::Scopes
  extend ActiveSupport::Concern

  included do
    scope :current, -> { where account_id: Account.current_id }
  end

  module ClassMethods
    def by_auth_token token
      where(auth_token: token).includes(:organizations).take
    end
  end
end
