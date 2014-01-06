module OrganizationsHelper
  def admin_subdomain?
    RESERVED_SUBDOMAINS.include? request.subdomains.first
  end
end
