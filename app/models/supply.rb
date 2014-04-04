class Supply < ActiveRecord::Base
  include Auditable
  include Supplies::Validation

  belongs_to :commodity
  belongs_to :warehouse
end
