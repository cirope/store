module Feedbacks::Scopes
  extend ActiveSupport::Concern

  included do
    scope :scored,  -> { where.not score: nil }
    scope :ordered, -> { order updated_at: :desc }
  end

  module ClassMethods
    def from_token token
      where(token: token).take!
    end

    def by_score score
      where score: score
    end

    def stats start: Time.zone.today, finish: Time.zone.today
      with_receipts_between(start, finish).scored.group(:score).count
    end

    def with_receipts_between start, finish
      joins(:receipt).where receipts: { issued_at: start..finish }
    end
  end
end
