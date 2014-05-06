module Bounds::Validation
  extend ActiveSupport::Concern

  included do
    before_save :check_times

    validates :start, :finish, timeliness: { type: :time }, allow_blank: true
    validate :not_all_blank
  end

  private

    def check_times
      self.start = self.finish = nil if start.to_s(:time) == '00:00' && finish.to_s(:time) == '00:00'
    end

    def not_all_blank
      if user.blank? && notes.blank?
        errors.add :base, :blank
      end
    end
end
