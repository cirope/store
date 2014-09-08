class Tag < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Auditable
  include Tags::Scopes
  include Tags::Validation

  strip_fields :name

  def to_s
    name
  end
end
