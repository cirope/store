module DashboardHelper
  def dashboard_for organization
    dashboard_url subdomain: organization.subdomain
  end
end
