module Feedbacks::Scopes
  extend ActiveSupport::Concern

  module ClassMethods
    def from_token token
      where(token: token).take!
    end
  end
end
