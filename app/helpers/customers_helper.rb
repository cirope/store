module CustomersHelper
  def add_customer_link
    link_to new_customer_path, title: t('customers.new.customer'), data: { remote: true } do
      content_tag :span, nil, class: 'glyphicon glyphicon-plus-sign'
    end
  end
end
