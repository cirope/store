class Phone < ActiveRecord::Base
  include Attributes::Strip
  include Auditable
  include Phones::Validation

  strip_fields :phone

  belongs_to :entity

  def to_s
    phone
  end
end
