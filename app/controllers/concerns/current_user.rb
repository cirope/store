module CurrentUser
  extend ActiveSupport::Concern

  included do
    before_action :store_current_user

    helper_method :current_user
  end

  def current_user
    @_current_user ||= user_by_auth_token if cookies[:auth_token]
  end

  private

    def user_by_auth_token
      User.by_auth_token cookies.encrypted[:auth_token]
    end

    def store_current_user
      User.current_id = current_user.try :id
    end
end
