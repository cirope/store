class Organization < ActiveRecord::Base
  include Accounts::Scoped
  include Organizations::Scopes
  include Organizations::Validation

  has_many :invoices, dependent: :destroy

  def to_s
    name
  end
end
