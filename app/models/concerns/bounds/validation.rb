module Bounds::Validation
  extend ActiveSupport::Concern

  included do
    validate :not_all_blank
  end

  private

    def not_all_blank
      if user.blank? && notes.blank?
        errors.add :base, :blank
      end
    end
end
