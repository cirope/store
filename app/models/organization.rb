class Organization < ActiveRecord::Base
  include Accounts::Scoped
  include Organizations::Scopes
  include Organizations::Validation

  def to_s
    name
  end
end
