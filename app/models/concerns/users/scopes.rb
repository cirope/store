module Users::Scopes
  extend ActiveSupport::Concern

  included do
    scope :current, -> {
      joins(:organizations).where organizations: { id: Organization.current_id }
    }
  end

  module ClassMethods
    def by_auth_token token
      where(auth_token: token).includes(:organizations).take
    end
  end
end
