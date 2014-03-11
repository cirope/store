class Item < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Auditable
  include Items::Validation
  include Items::Scopes

  strip_fields :code, :name

  has_many :supplies, dependent: :destroy

  def to_s
    name
  end
end
