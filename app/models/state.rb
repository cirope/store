class State < ActiveRecord::Base
  include Attributes::Strip
  include Auditable
  include Accounts::Scoped
  include States::Validation

  strip_fields :name

  belongs_to :account
  has_many :cities, dependent: :destroy
end
