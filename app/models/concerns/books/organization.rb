module Books::Organization
  extend ActiveSupport::Concern

  included do
    delegate :entity, to: :organization, prefix: true
    belongs_to :organization
  end
end
