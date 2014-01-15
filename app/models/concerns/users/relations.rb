module Users::Relations
  extend ActiveSupport::Concern

  included do
    has_many :relations, dependent: :destroy
    has_many :accounts, through: :relations

    accepts_nested_attributes_for :relations, allow_destroy: true, reject_if: :all_blank
  end
end
