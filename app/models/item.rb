class Item < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Auditable
  include Items::Scopes
  include Items::Supplies
  include Items::Validation

  strip_fields :code, :name

  def to_s
    name
  end
end
