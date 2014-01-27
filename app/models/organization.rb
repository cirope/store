class Organization < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Invoiceable
  include Organizations::Scopes

  has_many :books, -> { order 'kind' }, dependent: :destroy
  has_many :relations, dependent: :destroy

  def to_s
    name
  end
end
