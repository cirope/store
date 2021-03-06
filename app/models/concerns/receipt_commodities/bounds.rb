module ReceiptCommodities::Bounds
  extend ActiveSupport::Concern

  included do
    has_many :bounds, -> { order 'created_at ASC' }, as: :bondable, dependent: :destroy
    accepts_nested_attributes_for :bounds, allow_destroy: true, reject_if: :all_blank_in_bound
  end

  private

    def all_blank_in_bound attributes
      %w(user_id notes duration).all? { |a| attributes[a].blank? }
    end
end
