module DashboardHelper
  def dashboard_for account
    dashboard_url subdomain: account.subdomain
  end
end
