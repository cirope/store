class ReceiptCommodity < ActiveRecord::Base
  include Auditable
  include ReceiptCommodities::Validation

  belongs_to :commodity
  belongs_to :receipt
  has_many :bounds, -> { order 'created_at ASC' }, as: :bondable, dependent: :destroy
  accepts_nested_attributes_for :bounds, allow_destroy: true, reject_if: :all_blank
end
