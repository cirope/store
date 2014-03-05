module Purchases::Maker
  extend ActiveSupport::Concern

  included do
    belongs_to :maker, class_name: 'User'

    before_validation :set_maker_id, on: :create
  end

  private

    def set_maker_id
      self.maker_id = User.current_id
    end
end
