module ProvidersHelper
  def add_provider_link
    link_to new_provider_path, title: t('providers.new.provider'), data: { remote: true } do
      content_tag :span, nil, class: 'glyphicon glyphicon-plus-sign'
    end
  end
end
