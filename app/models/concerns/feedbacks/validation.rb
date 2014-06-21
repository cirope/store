module Feedbacks::Validation
  extend ActiveSupport::Concern

  included do
    validates :score, inclusion: { in: Feedback::SCORES }, allow_blank: true
    validates :owner, :customer, presence: true
  end
end
