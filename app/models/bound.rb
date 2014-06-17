class Bound < ActiveRecord::Base
  include Auditable
  include Bounds::Uses
  include Bounds::Validation

  belongs_to :user
  belongs_to :bondable, polymorphic: true

  def to_s
    "#{user} -> #{bondable}"
  end
end
