class Item < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Auditable
  include Items::Validation
  include Items::Scopes

  strip_fields :code, :name

  def to_s
    "[#{code}] #{name}"
  end
end
