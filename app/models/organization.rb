class Organization < ActiveRecord::Base
  include Accounts::Scoped
  include Organizations::Scopes
  include Organizations::Validation

  belongs_to :account

  def to_s
    name
  end
end
