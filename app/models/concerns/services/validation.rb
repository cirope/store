module Services::Validation
  extend ActiveSupport::Concern

  included do
    validates :duration, numericality: {
      only_integer: true, greater_than: 0, less_than: 2_147_483_648
    }, allow_blank: true
  end
end
