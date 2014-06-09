class Entity < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Auditable
  include Entities::Phones
  include Entities::TaxCondition
  include Entities::Validation

  strip_fields :tax_id, :name, :email

  belongs_to :city
  belongs_to :invoiceable, polymorphic: true

  def to_s
    name
  end
end
