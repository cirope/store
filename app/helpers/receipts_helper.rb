module ReceiptsHelper
  def receipt_items
    @receipt.receipt_items.new if @receipt.receipt_items.empty?

    @receipt.receipt_items
  end

  def receipt_number
    @receipt.persisted? ? @receipt.number : @book.next_available_number
  end

  def receipt_date
    @receipt.persisted? ? @receipt.created_at.to_date : Date.today
  end

  def add_customer_link
    link_to new_customer_path, title: t('receipts.new.customer'), data: { remote: true } do
      content_tag :span, nil, class: 'glyphicon glyphicon-plus-sign'
    end
  end
end
