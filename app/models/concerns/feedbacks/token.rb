module Feedbacks::Token
  extend ActiveSupport::Concern

  included do
    after_initialize :assign_token, if: :new_record?
  end

  def assign_token
    self.token = SecureRandom.urlsafe_base64
  end
end
