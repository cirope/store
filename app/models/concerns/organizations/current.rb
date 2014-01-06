module Organizations::Current
  extend ActiveSupport::Concern

  module ClassMethods
    def current_id
      Thread.current[:organization_id]
    end

    def current_id=(organization_id)
      Thread.current[:organization_id] = organization_id
    end
  end
end
