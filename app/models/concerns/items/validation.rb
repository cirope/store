module Items::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, :code, presence: true, length: { maximum: 255 }
    validates :code, uniqueness: { case_sensitive: false, scope: :account_id }
  end
end
