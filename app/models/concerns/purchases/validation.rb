module Purchases::Validation
  extend ActiveSupport::Concern

  included do
    validates :provider, :requested_at, presence: true
    validates :requested_at, timeliness: { type: :date }
    validates :delivered_at, timeliness: { type: :date, on_or_after: :requested_at }, allow_blank: true
  end
end
