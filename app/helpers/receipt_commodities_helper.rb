module ReceiptCommoditiesHelper
  def link_to_bounds form
    user_icon = content_tag :span, nil, class: 'glyphicon glyphicon-user'

    link_to user_icon, "#bounds-#{form.object.object_id}", class: 'text-muted', data: { toggle: 'collapse' }
  end
end
