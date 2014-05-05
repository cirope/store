module Customers::Validation
  extend ActiveSupport::Concern

  included do
    validates :birth, timeliness: { type: :date }, allow_blank: true
  end
end
