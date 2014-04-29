module CustomersHelper
  def add_customer_link
    link_to new_customer_path, title: t('customers.new.customer'), data: { remote: true } do
      content_tag :span, nil, class: 'glyphicon glyphicon-plus-sign'
    end
  end

  def customer_vouchers_link book, customer
    count = book.sheets.where(customer_id: customer.id).count
    kind = book.kind_class.to_s.tableize
    link_label = t "customers.#{kind}", count: count

    link_to_if count > 0, link_label, [book, book.kind_class, customer_id: customer.id]
  end
end
