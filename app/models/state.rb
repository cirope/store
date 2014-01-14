class State < ActiveRecord::Base
  include Attributes::Strip
  include Auditable
  include States::Scopes
  include States::Validation

  strip_fields :name

  belongs_to :organization
end
