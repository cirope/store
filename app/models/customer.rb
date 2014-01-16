class Customer < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Auditable
  include Customers::Validation

  strip_fields :tax_id, :name

  belongs_to :city

  def to_s
    name
  end
end
