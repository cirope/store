class City < ActiveRecord::Base
  include Attributes::Strip
  include Auditable
  include Cities::Validation
  include Accounts::Scoped

  strip_fields :name, :zip_code

  belongs_to :state
  belongs_to :account
end
