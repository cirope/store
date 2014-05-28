class Commodity < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Auditable
  include Commodities::DestroyValidation
  include Commodities::Scopes
  include Commodities::Validation

  strip_fields :code, :name

  belongs_to :classification, polymorphic: true
  has_many :supplies, dependent: :destroy
  has_many :receipt_commodities, dependent: :destroy
  has_many :invoice_commodities, dependent: :destroy

  def to_s
    name
  end
end
