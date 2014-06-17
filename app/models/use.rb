class Use < ActiveRecord::Base
  include Auditable
  include Uses::Validation

  delegate :unit, to: :item, allow_nil: true

  belongs_to :bound
  belongs_to :item
end
