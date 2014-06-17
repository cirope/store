module Bounds::Uses
  extend ActiveSupport::Concern

  included do
    has_many :uses, dependent: :destroy
    accepts_nested_attributes_for :uses, allow_destroy: true, reject_if: :all_blank
  end
end
