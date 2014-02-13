class Warehouse < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Auditable
  include Warehouses::Validation

  strip_fields :name

  has_many :supplies, dependent: :destroy

  def to_s
    name
  end
end
