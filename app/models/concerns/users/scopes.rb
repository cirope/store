module Users::Scopes
  extend ActiveSupport::Concern

  module ClassMethods
    def by_auth_token token
      scope = Account.current_id ? self : unscoped

      scope.where(auth_token: token).includes(:organizations).take
    end

    def search query: nil, limit: false
      result = User.order 'name ASC'

      if query.present?
        result = result.where "#{table_name}.name ILIKE ?", "%#{query.strip}%"
      end

      limit ? result.limit(10) : result
    end
  end
end
