class Purchase < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Books::Numerable
  include Purchases::Maker
  include Purchases::Receiver
  include Purchases::Validation

  include Purchases::Provider
  def to_s
    number.to_s
  end
end
