module Customers::LastReceipt
  extend ActiveSupport::Concern

  def last_receipt_date
    last_receipt.try :issued_at
  end

  private

    def last_receipt
      receipts.ordered.last
    end
end
