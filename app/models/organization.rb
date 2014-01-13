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

  has_many :relations, dependent: :destroy
  has_many :users, through: :relations
end
