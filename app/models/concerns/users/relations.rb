module Users::Relations
  extend ActiveSupport::Concern

  included do
    has_many :organizations, through: :relations

    has_many :relations, dependent: :destroy
    accepts_nested_attributes_for :relations, allow_destroy: true, reject_if: :all_blank
  end
end
