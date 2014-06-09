module Entities::Phones
  extend ActiveSupport::Concern

  included do
    has_many :phones, dependent: :destroy
    accepts_nested_attributes_for :phones, reject_if: :all_blank
  end
end
