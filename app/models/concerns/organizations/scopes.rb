module Organizations::Scopes
  extend ActiveSupport::Concern

  module ClassMethods
    def by_subdomain subdomain
      unless RESERVED_SUBDOMAINS.include?(subdomain)
        find_by!(subdomain: subdomain) if subdomain.present?
      end
    end

    def search query: nil, limit: false
      if query.present?
        result = Organization.where 'name ILIKE ?', "%#{query.strip}%"
      else
        result = Organization.all
      end

      limit ? result.limit(10) : result
    end
  end
end
