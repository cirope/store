class State < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Auditable
  include States::Validation

  strip_fields :name

  has_many :cities, dependent: :destroy

  def to_s
    name
  end
end
