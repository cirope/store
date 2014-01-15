module Organizations::Validation
  extend ActiveSupport::Concern

  included do
    validates :name,
      presence: true,
      length: { maximum: 255 },
      uniqueness: { case_sensitive: false, scope: :account_id }
    validates :account_id, presence: true
  end
end
