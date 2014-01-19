class Customer < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Invoiceable

  def to_s
    name
  end
end
