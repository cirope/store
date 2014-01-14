module States::Validation
  extend ActiveSupport::Concern

  included do
    validates :organization, :name, presence: true
    validates :name,
      length:     { maximum: 255 },
      uniqueness: { case_sensitive: false, scope: :organization_id }
  end
end
