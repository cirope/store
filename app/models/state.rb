class State < ActiveRecord::Base
  include Attributes::Strip
  include Auditable
  include Organizations::Scoped
  include States::Validation

  strip_fields :name

  belongs_to :organization
  has_many :cities, dependent: :destroy
end
