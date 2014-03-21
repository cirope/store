class Warehouse < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Auditable
  include Warehouses::Default
  include Warehouses::Validation

  strip_fields :name

  has_many :supplies, dependent: :destroy
  accepts_nested_attributes_for :supplies, allow_destroy: true, reject_if: :all_blank

  def to_s
    name
  end
end
