module ReceiptCommoditiesHelper
  def receipt_commodity_bounds form
    receipt_commodity = form.object

    receipt_commodity.bounds.new if receipt_commodity.bounds.empty?

    receipt_commodity.bounds
  end

  def link_to_bounds form
    user_icon = content_tag :span, nil, class: 'glyphicon glyphicon-user'

    link_to user_icon, "#bounds-#{form.object.object_id}", data: { toggle: 'collapse' }
  end
end
