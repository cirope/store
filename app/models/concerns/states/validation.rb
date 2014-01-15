module States::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, :account, presence: true
    validates :name,
      length:     { maximum: 255 },
      uniqueness: { case_sensitive: false, scope: :account_id }
  end
end
