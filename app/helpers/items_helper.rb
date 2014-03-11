module ItemsHelper
  def add_item_link
    link_to new_item_path, title: t('items.new.item'), data: { remote: true } do
      content_tag :span, nil, class: 'glyphicon glyphicon-plus-sign'
    end
  end
end
