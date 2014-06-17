module ReceiptsHelper
  def receipt_commodities
    @receipt.receipt_commodities.new if @receipt.receipt_commodities.empty?

    @receipt.receipt_commodities
  end

  def receipt_number
    @receipt.persisted? ? @receipt.number : @book.next_available_number
  end

  def new_receipt_link options = {}
    link_to_new new_book_receipt_path(@book, customer_id: params[:customer_id]), options
  end

  def receipt_commodity_info_link receipt_commodity
    link_to "#bounds-#{receipt_commodity.object_id}", data: { toggle: 'collapse' } do
      content_tag :span, nil, class: 'glyphicon glyphicon-info-sign'
    end
  end
end
