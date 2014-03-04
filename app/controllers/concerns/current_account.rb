module CurrentAccount
  extend ActiveSupport::Concern

  included do
    before_action :remember_current_account

    helper_method :current_account
  end

  def current_account
    @current_account ||= Account.by_subdomain request.subdomains.first
  end

  private

    def remember_current_account
      Account.current_id = current_account.try :id
    end
end
