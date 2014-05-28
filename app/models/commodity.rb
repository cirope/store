class Commodity < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Auditable
  include Commodities::Validation
  include Commodities::Scopes

  strip_fields :code, :name

  belongs_to :classification, polymorphic: true
  has_many :supplies, dependent: :destroy
  has_many :receipt_commodities

  def to_s
    name
  end
end
