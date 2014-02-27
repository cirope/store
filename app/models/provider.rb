class Provider < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Entities::Searchable
  include Invoiceable

  def to_s
    name
  end
end
