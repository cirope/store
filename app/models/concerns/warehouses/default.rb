module Warehouses::Default
  extend ActiveSupport::Concern

  module ClassMethods
    def default
      order('created_at ASC').first
    end
  end
end
