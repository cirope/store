module CustomersHelper
  def add_customer_link
    link_to new_customer_path, title: t('customers.new.customer'), data: { remote: true } do
      content_tag :span, nil, class: 'glyphicon glyphicon-plus-sign'
    end
  end

  def customer_vouchers_link book, customer
    count = book.sheets_count_by_customer(customer)
    kind = book.kind_class.to_s.tableize
    link_label = t "customers.#{kind}", count: count

    link_to_if count > 0, link_label, [book, book.kind_class, customer_id: customer.id]
  end

  def customer_date_picker_options
    {
      date_picker_options: {
        minDate: '-100Y',
        maxDate: '+0D',
        yearRange: "#{Time.zone.today.year - 100}:#{Time.zone.today.year}",
        changeMonth: true,
        changeYear: true
      }
    }
  end

  def customer_time_ago_to_last_receipt customer
    last_receipt_date = customer.last_receipt_date

    if last_receipt_date
      t 'customers.receipts.last_date', time_ago: time_ago_in_words(last_receipt_date)
    else
      t 'customers.receipts.zero'
    end
  end
end
