module ReceiptCommodities::Bounds
  extend ActiveSupport::Concern

  included do
    has_many :bounds, -> { order 'created_at ASC' }, as: :bondable, dependent: :destroy
    accepts_nested_attributes_for :bounds, allow_destroy: true, reject_if: :user_and_notes_blank?
  end

  private

    def user_and_notes_blank? attributes
      attributes['user_id'].blank? && attributes['notes'].blank?
    end
end
