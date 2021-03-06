class User < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Attributes::Downcase
  include Auditable
  include Users::Authentication
  include Users::Current
  include Users::Overrides
  include Users::PasswordReset
  include Users::Relations
  include Users::Scopes
  include Users::Validation

  delegate :subdomain, to: :account, prefix: true

  strip_fields :name, :lastname, :email
  downcase_fields :email
end
