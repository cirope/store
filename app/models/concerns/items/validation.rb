module Items::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, :code, length: { maximum: 255 }
    validates :code, presence: true, uniqueness: { case_sensitive: false, scope: :account_id }
  end
end
