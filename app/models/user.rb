class User < ActiveRecord::Base
  include Attributes::Strip
  include Attributes::Downcase
  include Auditable
  include Users::Authentication
  include Users::Overrides
  include Users::PasswordReset
  include Users::Relations
  include Users::Validation

  strip_fields :name, :lastname, :email
  downcase_fields :email
end
