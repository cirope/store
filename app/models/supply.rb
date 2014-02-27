class Supply < ActiveRecord::Base
  include Auditable
  include Supplies::Validation

  belongs_to :item
  belongs_to :warehouse
end