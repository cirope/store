module Customers::Validation
  extend ActiveSupport::Concern

  included do
    validates :birth, timeliness: { type: :date }
  end
end
