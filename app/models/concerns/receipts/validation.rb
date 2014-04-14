module Receipts::Validation
  extend ActiveSupport::Concern

  included do
    validates :customer, :issued_at, presence: true
    validates :issued_at, timeliness: { type: :date }
  end
end
