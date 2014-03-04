module Users::Current
  extend ActiveSupport::Concern

  module ClassMethods
    def current_id
      Thread.current[:user_id]
    end

    def current_id=(user_id)
      Thread.current[:user_id] = user_id
    end
  end
end
