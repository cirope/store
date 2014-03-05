module Purchases::Receiver
  extend ActiveSupport::Concern

  included do
    belongs_to :receiver, class_name: 'User'

    before_validation :set_receiver_id
  end

  private

    def set_receiver_id
      self.receiver_id = User.current_id if delivered_at_changed?
    end
end
