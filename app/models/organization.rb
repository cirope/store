class Organization < ActiveRecord::Base
  include Attributes::Strip
  include Attributes::Downcase
  include Auditable
  include Organizations::Current
  include Organizations::Overrides
  include Organizations::Scopes
  include Organizations::Validation

  strip_fields :name, :subdomain
  downcase_fields :subdomain
end
