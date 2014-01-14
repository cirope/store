module Users::Scopes
  extend ActiveSupport::Concern

  module ClassMethods
    def by_auth_token token
      where(auth_token: token).includes(:organizations).take
    end
  end
end
