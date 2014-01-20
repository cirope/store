class Organization < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Invoiceable
  include Organizations::Scopes

  has_many :books, dependent: :destroy

  def to_s
    name
  end
end
