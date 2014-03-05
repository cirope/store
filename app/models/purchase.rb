class Purchase < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Books::Numerable
  include Purchases::Maker
  include Purchases::Receiver
  include Purchases::Validation

  belongs_to :provider

  def to_s
    number.to_s
  end
end
