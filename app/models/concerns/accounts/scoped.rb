module Accounts::Scoped
  extend ActiveSupport::Concern

  included do
    default_scope -> { where account_id: Account.current_id }
  end
end
