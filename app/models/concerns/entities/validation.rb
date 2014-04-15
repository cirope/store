module Entities::Validation
  extend ActiveSupport::Concern

  included do
    validates :tax_condition, :name, :city_id, presence: true
    validates :tax_id, presence: true, if: :validate_tax_id_presence?
    validates :tax_id, :tax_condition, :name, length: { maximum: 255 }
    validates :tax_id, :name, uniqueness: { case_sensitive: false, scope: :account_id }, allow_blank: true
    validates :email,
      uniqueness: { case_sensitive: false },
      format: { with: EMAIL_REGEX }, allow_blank: true
  end
end
