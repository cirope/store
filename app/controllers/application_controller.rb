class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :scope_current_organization

  def user_for_paper_trail
    current_user.try :id
  end

  private

    def current_user
      @current_user ||= User.by_auth_token(cookies.encrypted[:auth_token]) if cookies[:auth_token]
    end
    helper_method :current_user

    def current_organization
      @current_organization ||= Organization.by_subdomain request.subdomains.first
    end
    helper_method :current_organization

    def authorize
      Rack::MiniProfiler.authorize_request if current_user.try :is_admin?

      redirect_to login_url, alert: t('messages.not_authorized') unless current_user
    end

    def scope_current_organization
      Organization.current_id = current_organization.try(:id)
    end
end
