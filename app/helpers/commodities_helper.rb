module CommoditiesHelper
  def add_commodity_link
    link_to new_commodity_path, title: t('commodities.new.commodity'), data: { remote: true } do
      content_tag :span, nil, class: 'glyphicon glyphicon-plus-sign'
    end
  end
end
